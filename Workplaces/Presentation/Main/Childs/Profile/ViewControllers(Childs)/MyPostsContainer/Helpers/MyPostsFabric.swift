//
//  MyPostsFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class MyPostsFabric {
    
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
    
    /// Метод для получения MyPostsViewController
    public func getMyPostsViewController() -> ListPostsViewController {
        return listPostsFabric.getListPostsController(from: .myPosts)
    }
    
    /// Метод для получения NewPostViewController
    public func getNewPostViewController() -> NewPostViewController {
        return NewPostViewController()
    }
    
    /// Метод для получения MyPostsVoidController
    public func getMyPostsVoidController() -> ZeroViewController {
        return zeroFabric.getMyPostsVoidController()
    }
    
}
