//
//  HomeFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class HomeFabric {
    
    // MARK: - Private Properties
    
    private let homeVoidContainerFabric: HomeVoidFabric
    private let zeroFabric: ZeroFabric
    
    // MARK: - Initialization
    
    init(
        homeVoidContainerFabric: HomeVoidFabric,
        zeroFabric: ZeroFabric
    ) {
        self.homeVoidContainerFabric = homeVoidContainerFabric
        self.zeroFabric = zeroFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения ListPostsViewController
    func getPostsViewController() -> ListPostsViewController {
        return ListPostsViewController(listPostsType: .feed)
    }
    
    /// Метод для получения HomeVoidContainerController
    func getVoidContainerController() -> HomeVoidContainerController {
        return HomeVoidContainerController(homeVoidContainerFabric: homeVoidContainerFabric)
    }
    
    /// Метод для получения ZeroViewController
    func getErrorViewController() -> ZeroViewController {
        return zeroFabric.getFeedErrorController()
    }
    
    /// Метод для получения TitleHeader
    func getTitleHeaderView() -> TitleHeader {
        let header = TitleHeader()
        header.setTitle("Популярное")
        return header
    }
    
}
