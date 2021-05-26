//
//  HomeCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class HomeCoordinatingController: StackViewController {
    
    // MARK: - Private Properties
    
    private let feedService: FeedServiceProtocol
    private let profileService: ProfileServiceProtocol
    
    private let postsViewController: ListPostsViewController
    private let errorViewController: ZeroViewController
    private let homeVoidContainerController: HomeVoidContainerController
    private let headerView: TitleHeader
    private var currentViewController: UIViewController?
    
    // MARK: - Initialization
    
    init(
        feedService: FeedServiceProtocol = ServiceLayer.shared.feedService,
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        homeFabric: HomeFabric
    ) {
        self.feedService = feedService
        self.profileService = profileService
        
        self.postsViewController = homeFabric.getPostsViewController()
        self.errorViewController = homeFabric.getErrorViewController()
        self.homeVoidContainerController = homeFabric.getVoidContainerController()
        self.headerView = homeFabric.getTitleHeaderView()
        
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupStack()
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func setupStack() {
        addArrangedSubview(headerView)
        
        errorViewController.delegate = self
        homeVoidContainerController.delegate = self
        
        postsViewController.delegate = self
        addArrangedViewController(postsViewController)
        currentViewController = postsViewController
    }
    
    private func loadData() {
        _ = feedService.getFeed { result in
            switch result {
            case .success(let posts):
                if posts.isEmpty {
                    self.showVoidContainer()
                } else {
                    let postsViewModel = posts.map { PostViewModel.map(from: $0) }
                    self.postsViewController.configure(with: postsViewModel)
                }
            case .failure:
                self.showErrorController()
            }
            
        }
    }
    
    private func reload() {
        loadData()
        showPostsController()
    }
    
    private func showPostsController() {
        hideCurrentControllerIfNeeded()
        showChild(postsViewController, to: view)
    }
    
    private func showErrorController() {
        hideCurrentControllerIfNeeded()
        showChild(errorViewController, to: view)
    }
    
    private func showVoidContainer() {
        hideCurrentControllerIfNeeded()
        showChild(homeVoidContainerController, to: view)
    }
    
    private func hideCurrentControllerIfNeeded() {
        guard let current = currentViewController else { return }
        hideChild(current)
    }
    
    private func like(_ post: PostViewModel) {
        _ = feedService.likePost(
            with: post.id
        ) { _ in }
    }
    
}

// MARK: - ZeroViewControllerDelegate

extension HomeCoordinatingController: ZeroViewControllerDelegate {
    func zeroViewController() {
        reload()
    }
}

// MARK: - ListPostsViewControllerDelegate

extension HomeCoordinatingController: ListPostsViewControllerDelegate {
    func listPostsViewControllerLike(_ post: PostViewModel) {
        like(post)
    }
    
    func listPostsViewControllerScrollToBottom() {
        headerView.hide()
    }
    
    func listPostsViewControllerScrollToTop() {
        headerView.show()
    }

}

// MARK: - HomeVoidContainerControllerDelegate

extension HomeCoordinatingController: HomeVoidContainerControllerDelegate {
    func homeVoidContainerControllerAddFriend(_ friendID: String) {
        _ = profileService.addFriend(with: friendID) { _ in }
    }
    
    func homeVoidContainerController(_ searchText: String) {
        _ = profileService.searchUser(searchText) { result in
            switch result {
            case .success(let data):
                let friendModels = data.map { FriendViewModel.map(from: $0) }
                self.homeVoidContainerController.updateUsersList(friendModels)
            case .failure:
                break
            }
        }
    }
}
