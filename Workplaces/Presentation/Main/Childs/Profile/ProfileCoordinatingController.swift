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

protocol ProfileCoordinatingControllerDelegate: class {
    
    /// метод, вызываемый при логауте
    func profileCoordinatingControllerLogout()
    
    /// метод, вызываемый при нажатии кнопки "Перейти к ленте"
    func profileCoordinatingControllerToHome()
}

final class ProfileCoordinatingController: StackViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: ProfileCoordinatingControllerDelegate?
    
    // MARK: - Private Properties
    
    private let profileService: ProfileServiceProtocol
    
    private let profileCardController: ProfileCardViewController
    private let postsContainerController: MyPostsContainerController
    private let likedContainerController: LikedPostsContainerController
    private let friendsContainerController: FriendsContainerController
    
    private var currentState: ProfileState = .posts
    private var currentVC: UIViewController?
    
    // MARK: - Initialization

    init(
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        profileFabric: ProfileFabric
    ) {
        self.profileService = profileService
        
        self.profileCardController = profileFabric.getProfileCardViewController()
        self.postsContainerController = profileFabric.getMyPostsContainerController()
        self.likedContainerController = profileFabric.getLikedPostsContainerController()
        self.friendsContainerController = profileFabric.getFriendsContainerController()
        
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
        profileCardController.delegate = self
        addArrangedViewController(profileCardController)
        
        let menu = ProfileMenuView()
        menu.delegate = self
        addArrangedSubview(menu)
        
        likedContainerController.delegate = self
        changeMainView()
    }
    
    private func loadData() {
        loadProfile()
        loadMyPosts()
        loadLikedPosts()
        loadFriends()
    }
    
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
                let myPosts = posts.map { PostViewModel.map(from: $0) }
                self.postsContainerController.configure(with: myPosts)
            case .failure:
                break
            }
        }
    }
    
    private func loadLikedPosts() {
        _ = profileService.getPosts { data in
            switch data {
            case .success(let posts):
                let likedPosts = posts.map { PostViewModel.map(from: $0) }
                self.likedContainerController.configure(with: likedPosts)
            case .failure:
                break
            }
        }
    }
    
    private func loadFriends() {
        _ = profileService.getFriends { data in
            switch data {
            case .success(let friends):
                let friends = friends.map { FriendViewModel.map(from: $0) }
                self.friendsContainerController.configure(with: friends)
            case .failure:
                break
            }
        }
    }
    
    // MARK: - Childs
    
    private func changeMainView() {
        var willShowViewController: UIViewController {
            switch currentState {
            case .posts:
                return postsContainerController
            case .likes:
                return likedContainerController
            case .friends:
                return friendsContainerController
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

extension ProfileCoordinatingController: ProfileCardDelegate {
    func profileCardEdit() {
        routeToEditing()
    }
    
    func profileCardLogout() {
        delegate?.profileCoordinatingControllerLogout()
    }
}

// MARK: - ProfileMenuDelegate

extension ProfileCoordinatingController: ProfileMenuDelegate {
    func profileMenu(newState: Int) {
        guard let state = ProfileState(rawValue: newState)
        else { return }
        
        currentState = state
        changeMainView()
    }
}

// MARK: - LikedPostsContainerControllerDelegate

extension ProfileCoordinatingController: LikedPostsContainerControllerDelegate {
    func likedPostsContainerControllerToHome() {
        delegate?.profileCoordinatingControllerToHome()
    }
}
