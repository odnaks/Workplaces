//
//  MainCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

protocol MainCoordinatingControllerDelegate: AnyObject {
    
    /// метод, вызываемый при логауте
    func mainCoordinatingControllerLogout()
}

final class MainCoordinatingController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: MainCoordinatingControllerDelegate?
    
    // MARK: - Private Properties
    
    private let feedService: FeedServiceProtocol
    private let profileSerice: ProfileServiceProtocol
    
    private let mainTabBarController: MainTabBarController
    private let profileCoordinatingController: ProfileCoordinatingController
    private let homeCoordinatingController: HomeCoordinatingController
    private let newPostViewController: NewPostViewController
    
    // MARK: - Initialization
    
    init(
        feedService: FeedServiceProtocol = ServiceLayer.shared.feedService,
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        mainFabric: MainFabric
    ) {
        self.feedService = feedService
        self.profileSerice = profileService
        
        self.mainTabBarController = mainFabric.getMainTabBarController()
        self.profileCoordinatingController = mainFabric.getProfileCoordinatingController()
        self.homeCoordinatingController = mainFabric.getHomeCoordinatingController()
        self.newPostViewController = mainFabric.getNewPostViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    // MARK: - Private methods
    
    private func setupTabBar() {
        profileCoordinatingController.delegate = self
        
        mainTabBarController.setup(
            [
                homeCoordinatingController,
                profileCoordinatingController
            ]
        )
        mainTabBarController.mainTabBarDelegate = self
        
        showChild(mainTabBarController, to: view)
    }
    
    private func showNewPostController() {
        newPostViewController.delegate = self
        
        self.present(newPostViewController, animated: true)
    }
    
    private func switchTabToHome() {
        mainTabBarController.switchToHome()
    }
}

// MARK: - MainTabBarControllerDelegate

extension MainCoordinatingController: MainTabBarControllerDelegate {
    func mainTabBarControllerNewPost() {
        showNewPostController()
    }
}

// MARK: - ProfileCoordinatingControllerDelegate

extension MainCoordinatingController: ProfileCoordinatingControllerDelegate {
    func profileCoordinatingControllerToHome() {
        switchTabToHome()
    }
    
    func profileCoordinatingControllerLogout() {
        delegate?.mainCoordinatingControllerLogout()
    }
}

// MARK: - NewPostViewControllerDelegate

extension MainCoordinatingController: NewPostViewControllerDelegate {
    func newPostViewControllerPost() {
        print(#function)
    }
}
