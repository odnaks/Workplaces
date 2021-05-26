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
    
    // MARK: - Initialization
    
    init(
        zeroFabric: ZeroFabric
    ) {
        self.zeroFabric = zeroFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения MyPostsViewController
    func getMyPostsViewController() -> ListPostsViewController {
        return ListPostsViewController(listPostsType: .myPosts)
    }
    
    /// Метод для получения NewPostViewController
    func getNewPostViewController() -> NewPostViewController {
        return NewPostViewController()
    }
    
    /// Метод для получения MyPostsVoidController
    func getMyPostsVoidController() -> ZeroViewController {
        return zeroFabric.getMyPostsVoidController()
    }
    
}
