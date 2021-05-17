//
//  ProfileFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 10.05.2021.
//

import Foundation

final class ProfileFabric {
    
    // MARK: - Private Properties
    
    private let listPostsFabric: ListPostsFabric
    private let profileService: ProfileServiceProtocol
    
    // MARK: - Public Methods
    
    /// Метод для получения FriendsViewController
    public func getFriendsViewController() -> FriendsViewController {
        return FriendsViewController()
    }
    
    /// Метод для получения ListPostsViewController со списком постов пользователя
    public func getListPostsViewController() -> ListPostsViewController {
        return listPostsFabric.getListPostsController(from: .myPosts)
    }
    
    /// Метод для получения ListPostsViewController со списком лайкнутых постов
    public func getListLikedPostsViewController() -> ListPostsViewController {
        return listPostsFabric.getListPostsController(from: .myLiked)
    }
    
    // MARK: - Initialization
    
    init(
        listPostsFabric: ListPostsFabric,
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService
    ) {
        self.profileService = profileService
        self.listPostsFabric = listPostsFabric
    }
}
