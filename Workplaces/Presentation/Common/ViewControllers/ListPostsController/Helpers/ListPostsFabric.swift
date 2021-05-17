//
//  ListPostsFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 10.05.2021.
//

import Foundation

public enum ListPostsType {
    case feed
    case myPosts
    case myLiked
}

final class ListPostsFabric {
    
    // MARK: - Private Properties
    
    private let profileService: ProfileServiceProtocol
    private let feedService: FeedServiceProtocol
    
    // MARK: - Public Methods
    
    /// Метод для получения ListPostsViewController с передаваемым типом постов
    public func getListPostsController(
        from type: ListPostsType
    ) -> ListPostsViewController {
        let controller = ListPostsViewController()
        
        return controller
    }
    
    // MARK: - Initialization
    
    init(
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService,
        feedService: FeedServiceProtocol = ServiceLayer.shared.feedService
    ) {
        self.profileService = profileService
        self.feedService = feedService
    }
}
