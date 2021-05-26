//
//  ProfileFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 10.05.2021.
//

import Foundation

final class ProfileFabric {
    
    // MARK: - Private Properties
    
    private let myPostsFabric: MyPostsFabric
    private let likedPostsFabric: LikedPostsFabric
    private let friendsFabric: FriendsFabric
    
    // MARK: - Initialization
    
    init(
        myPostsFabric: MyPostsFabric,
        likedPostsFabric: LikedPostsFabric,
        friendsFabric: FriendsFabric
    ) {
        self.myPostsFabric = myPostsFabric
        self.likedPostsFabric = likedPostsFabric
        self.friendsFabric = friendsFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения ProfileCardViewController
    func getProfileCardViewController() -> ProfileCardViewController {
        return ProfileCardViewController()
    }
    
    /// Метод для получения MyPostsContainerController
    func getMyPostsContainerController() -> MyPostsContainerController {
        return MyPostsContainerController(myPostsFabric: myPostsFabric)
    }
    
    /// Метод для получения LikedPostsContainerController
    func getLikedPostsContainerController() -> LikedPostsContainerController {
        return LikedPostsContainerController(likedPostsFabric: likedPostsFabric)
    }
    
    /// Метод для полученияFriendsContainerController
    func getFriendsContainerController() -> FriendsContainerController {
        return FriendsContainerController(friendsFabric: friendsFabric)
    }
}
