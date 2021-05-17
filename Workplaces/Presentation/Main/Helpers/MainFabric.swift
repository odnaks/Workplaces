//
//  MainFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class MainFabric {
    
    // MARK: - Private Properties
    
    private let profileFabric: ProfileFabric
    private let homeFabric: HomeFabric
    
    // MARK: - Initialization
    
    init(
        profileFabric: ProfileFabric,
        homeFabric: HomeFabric
    ) {
        self.profileFabric = profileFabric
        self.homeFabric = homeFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения MainTabBarController
    public func getMainTabBarController() -> MainTabBarController {
        return MainTabBarController()
    }
    
    /// Метод для получения HomeCoordinatingController
    public func getHomeCoordinatingController() -> HomeCoordinatingController {
        return HomeCoordinatingController(
            homeFabric: homeFabric
        )
    }
    
    /// Метод для получения ProfileCoordinatingController
    public func getProfileCoordinatingController() -> ProfileCoordinatingController {
        return ProfileCoordinatingController(
            profileFabric: profileFabric
        )
    }
    
    /// Метод для получения NewPostViewController
    public func getNewPostViewController() -> NewPostViewController {
        return NewPostViewController()
    }
    
}
