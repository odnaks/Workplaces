//
//  ProfileViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

private enum ProfileState: Int {
    case posts
    case likes
    case friends
}

final class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet private weak var profileCardView: ProfileCardView?
    @IBOutlet private weak var profileMenuView: ProfileMenuView?
    @IBOutlet private weak var dataContainerView: UIView?
    
    // MARK: - Private Properties
    
    private let profileService: ProfileServiceProtocol
    
    private let postsController: ListPostsViewController
    private let likesController: ListPostsViewController
    private let friendsController: FriendsViewController
    private let voidZeroController: ZeroViewController
    
    private var currentState: ProfileState = .posts
    private var currentVC: UIViewController?
    
    private var profileModel: ProfileViewModel?
    private var myPosts: [PostViewModel]?
    private var likedPosts: [PostViewModel]?
    private var friends: [FriendViewModel]?
    
    // MARK: - Initialization

    init(
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        profileFabric: ProfileFabric
    ) {
        self.profileService = profileService
        
        self.voidZeroController = ZeroViewController(zeroControllerType: .voidController)
        
        self.postsController = profileFabric.getListPostsViewController()
        self.likesController = profileFabric.getListLikedPostsViewController()
        self.friendsController = profileFabric.getFriendsViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileMenuView?.delegate = self
        profileCardView?.delegate = self
        
        changeMainView()
        
        loadData()
    }
    
    // MARK: - Private Methods
    
    private func loadData() {
        loadProfile()
        loadMyPosts()
        loadLikedPosts()
        loadFriends()
    }
    
    // TODO: Вынести в отдельный класс - лоадер
    // MARK: - Load Data
    
    private func loadProfile() {
        _ = profileService.getProfile { data in
            switch data {
            case .success(let profile):
                self.profileModel = ProfileViewModel.map(from: profile)
                self.profileCardView?.configure(with: self.profileModel)
            case .failure:
                break
            }
        }
    }
    
    private func loadMyPosts() {
        _ = profileService.getPosts { data in
            switch data {
            case .success(let posts):
                self.myPosts = posts.map { ProfileViewModel.map(from: $0) }
                self.postsController.configure(with: self.myPosts)
            case .failure:
                break
            }
        }
    }
    
    private func loadLikedPosts() {
        _ = profileService.getPosts { data in
            switch data {
            case .success(let posts):
                self.likedPosts = posts.map { ProfileViewModel.map(from: $0) }
                self.likesController.configure(with: self.likedPosts)
            case .failure:
                break
            }
        }
    }
    
    private func loadFriends() {
        _ = profileService.getFriends { data in
            switch data {
            case .success(let friends):
                self.friends = friends.map { FriendViewModel.map(from: $0) }
                self.friendsController.configure(with: self.friends)
            case .failure:
                break
            }
        }
    }
    
    // MARK: - Childs
    
    private func showVoidZero() {
        guard let container = dataContainerView else { return }
        
        voidZeroController.delegate = self
        showChild(voidZeroController, to: container)
    }
    
    private func changeMainView() {
        guard let container = dataContainerView else { return }
        
        var willShowViewController: UIViewController {
            switch currentState {
            case .posts:
                return postsController
            case .likes:
                return likesController
            case .friends:
                return friendsController
            }
        }
        
        if let currentVC = currentVC {
            switchChild(
                viewControllerToHide: currentVC,
                viewControllerToShow: willShowViewController,
                containerView: container
            )
        } else {
            showChild(willShowViewController, to: container)
        }
        currentVC = willShowViewController
    }
    
    // MARK: - Routing
    
    private func routeToEditing() {
        let vc = EditingProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

// MARK: - ProfileMenuDelegate

extension ProfileViewController: ProfileCardDelegate {
    func profileCard(button: UIButton) {
        routeToEditing()
    }
}

// MARK: - ProfileMenuDelegate

extension ProfileViewController: ProfileMenuDelegate {
    func profileMenu(newState: Int) {
        guard let state = ProfileState(rawValue: newState)
        else { return }
        
        currentState = state
        changeMainView()
    }
    
}

// MARK: - ZeroViewControllerDelegate

extension ProfileViewController: ZeroViewControllerDelegate {
    func zeroViewController() {
        print(#function)
    }
}
