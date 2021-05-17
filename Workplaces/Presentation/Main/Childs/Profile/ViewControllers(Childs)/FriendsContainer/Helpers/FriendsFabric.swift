//
//  FriendsFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class FriendsFabric {
    
    // MARK: - Private Properties
    
    private let zeroFabric: ZeroFabric
    
    // MARK: - Initialization
    
    init(
        zeroFabric: ZeroFabric
    ) {
        self.zeroFabric = zeroFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения FriendsViewController
    public func getFriendsViewController() -> FriendsViewController {
        return FriendsViewController()
    }
    
    /// Метод для получения SearchFriendsViewController
    public func getSearchFriendsViewController() -> SearchFriendsViewController {
        return SearchFriendsViewController()
    }
    
    /// Метод для получения FriendsVoidController
    public func getFriendsVoidController() -> ZeroViewController {
        return zeroFabric.getFriendsVoidController()
    }
    
}
