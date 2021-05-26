//
//  LikedPostsFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class LikedPostsFabric {
    
    // MARK: - Private Properties
    
    private let zeroFabric: ZeroFabric
    
    // MARK: - Initialization
    
    init(
        zeroFabric: ZeroFabric
    ) {
        self.zeroFabric = zeroFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения LikedPostsViewController
    func getLikedPostsViewController() -> ListPostsViewController {
        return ListPostsViewController(listPostsType: .myLiked)
    }
    
    /// Метод для получения LikedPostsVoidController
    func getLikedPostsVoidController() -> ZeroViewController {
        return zeroFabric.getLikedPostsVoidController()
    }
    
}
