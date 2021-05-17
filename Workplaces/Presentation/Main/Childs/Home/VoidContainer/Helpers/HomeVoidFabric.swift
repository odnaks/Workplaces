//
//  HomeVoidFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class HomeVoidFabric {
    
    // MARK: - Private Properties
    
    private let zeroFabric: ZeroFabric
    
    // MARK: - Initialization
    
    init(
        zeroFabric: ZeroFabric
    ) {
        self.zeroFabric = zeroFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения SearchViewController
    public func getSearchFriendsViewController() -> SearchFriendsViewController {
        return SearchFriendsViewController()
    }
    
    /// Метод для получения FeedVoidController
    public func getFeedVoidController() -> ZeroViewController {
        return zeroFabric.getFeedVoidController()
    }
    
    /// Метод для получения UINavigationController
    public func getNavigationController() -> UINavigationController {
        return UINavigationController()
    }
    
}
