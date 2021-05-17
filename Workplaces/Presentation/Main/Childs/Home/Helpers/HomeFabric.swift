//
//  HomeFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class HomeFabric {
    
    // MARK: - Private Properties
    
    private let listPostsFabric: ListPostsFabric
    private let homeVoidContainerFabric: HomeVoidFabric
    
    // MARK: - Initialization
    
    init(
        listPostsFabric: ListPostsFabric,
        homeVoidContainerFabric: HomeVoidFabric
    ) {
        self.listPostsFabric = listPostsFabric
        self.homeVoidContainerFabric = homeVoidContainerFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения ListPostsViewController
    public func getPostsViewController() -> ListPostsViewController {
        return listPostsFabric.getListPostsController(from: .feed)
    }
    
    /// Метод для получения HomeVoidContainerController
    public func getVoidContainerController() -> HomeVoidContainerController {
        return HomeVoidContainerController(homeVoidContainerFabric: homeVoidContainerFabric)
    }
    
}
