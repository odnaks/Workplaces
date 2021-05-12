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

final class ProfileViewController: StackViewController {
    
    // MARK: - Private Properties
    
    private let profileService: ProfileServiceProtocol
    
    private let profileCardController: ProfileCardViewController
    private let postsController: ListPostsViewController
    private let likesController: ListPostsViewController
    private let friendsController: FriendsViewController
    private let voidZeroController: ZeroViewController
    
    private var currentState: ProfileState = .posts
    private var currentVC: UIViewController?
    
    // MARK: - Initialization

    init(
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        profileFabric: ProfileFabric
    ) {
        self.profileService = profileService
        
        self.voidZeroController = ZeroViewController(zeroControllerType: .voidController)
        
        self.profileCardController = profileFabric.getProfileCardViewController()
        self.postsController = profileFabric.getListPostsViewController()
        self.likesController = profileFabric.getListLikedPostsViewController()
        self.friendsController = profileFabric.getFriendsViewController()
        
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        setupStack()
    }
    
    // MARK: - Private Methods
    
    private func setupStack() {
        voidZeroController.delegate = self
        
        addArrangedViewController(profileCardController)
        
        let menu = ProfileMenuView()
        menu.delegate = self
        addArrangedSubview(menu)
        
        changeMainView()
    }
    
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
                let profileModel = ProfileViewModel.map(from: profile)
                self.profileCardController.configure(with: profileModel)
            case .failure:
                break
            }
        }
    }
    
    private func loadMyPosts() {
        _ = profileService.getPosts { data in
            switch data {
            case .success(let posts):
                let myPosts = posts.map { ProfileViewModel.map(from: $0) }
                self.postsController.configure(with: myPosts)
            case .failure:
                self.showVoidZero()
            }
        }
    }
    
    private func loadLikedPosts() {
        _ = profileService.getPosts { data in
            switch data {
            case .success(let posts):
                let likedPosts = posts.map { ProfileViewModel.map(from: $0) }
                self.likesController.configure(with: likedPosts)
            case .failure:
                self.showVoidZero()
            }
        }
    }
    
    private func loadFriends() {
        _ = profileService.getFriends { data in
            switch data {
            case .success(let friends):
                let friends = friends.map { FriendViewModel.map(from: $0) }
                self.friendsController.configure(with: friends)
            case .failure:
                self.showVoidZero()
            }
        }
    }
    
    // MARK: - Childs
    
    private func showVoidZero() {
        if let currentVC = currentVC {
            removeArrangedViewController(currentVC)
        }
        addArrangedViewController(voidZeroController)
        currentVC = voidZeroController
    }

    private func changeMainView() {
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
            removeArrangedViewController(currentVC)
        }
        
        addArrangedViewController(willShowViewController)
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
