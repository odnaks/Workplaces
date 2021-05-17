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
    private let listPostsFabric: ListPostsFabric
    
    // MARK: - Initialization
    
    init(
        zeroFabric: ZeroFabric,
        listPostsFabric: ListPostsFabric
    ) {
        self.zeroFabric = zeroFabric
        self.listPostsFabric = listPostsFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения LikedPostsViewController
    public func getLikedPostsViewController() -> ListPostsViewController {
        return listPostsFabric.getListPostsController(from: .myLiked)
    }
    
    /// Метод для получения LikedPostsVoidController
    public func getLikedPostsVoidController() -> ZeroViewController {
        return zeroFabric.getLikedPostsVoidController()
    }
    
}
