//
//  ProfileViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit
import WorkplacesAPI

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
    
    private var profileViewModel: ProfileViewModel?
    
    private var currentState: ProfileState = .posts
    private var currentVC: UIViewController?
    
    private var posts: [PostViewModel]?
    
    // MARK: - Initialization

    init(
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        zeroController: ZeroViewController = ZeroViewController(zeroControllerType: .voidController),
        postsController: ListPostsViewController = ListPostsViewController(),
        likesController: ListPostsViewController = ListPostsViewController(),
        friendsController: FriendsViewController = FriendsViewController()
    ) {
        self.profileService = profileService
        self.postsController = postsController
        self.likesController = likesController
        self.friendsController = friendsController
        
        self.voidZeroController = zeroController
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileMenuView?.delegate = self
        postsController.delegate = self
        
        changeMainView()
        
        _ = profileService.getProfile { [weak self] data in
            guard let self = self else { return }
            
            switch data {
            case .success(let profile):
                self.profileViewModel = self.mapToViewModel(profile)
                self.profileCardView?.configure(with: self.profileViewModel)
            case .failure:
                break
            }
        }
    }
    
    // MARK: - Private Methods
    
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
    }
}

// MARK: - ListPostsControllerDelegate

extension ProfileViewController: ListPostsControllerDelegate {
    func getPosts() -> [PostViewModel]? {
        return [PostViewModel(text: "11"), PostViewModel(text: "22"), PostViewModel(text: "33")]
    }
}

// MARK: - ProfileMenuDelegate

extension ProfileViewController: ProfileMenuDelegate {
    func changeState(_ state: Int) {
        guard let state = ProfileState(rawValue: state)
        else { return }
        
        currentState = state
        changeMainView()
    }
}

// MARK: - ZeroViewControllerDelegate

extension ProfileViewController: ZeroViewControllerDelegate {
    func handleClickButton() {
        print(#function)
    }
}

// MARK: - MapperToViewModel

extension ProfileViewController {
    func mapToViewModel(_ data: UserProfile) -> ProfileViewModel {
        let name = "\(data.firstName) \(data.lastName)"
        let years = data.birthDay.getYearsOld()
        let photo = data.avatarUrl
        
        return ProfileViewModel(
            name: name,
            years: years,
            photo: photo
        )
    }
}
