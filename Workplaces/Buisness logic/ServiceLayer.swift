//
//  ServiceLayer.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import Foundation

protocol ServiceLayerProtocol {
    var authorizationService: AuthorizationServiceProtocol { get }
}

final class ServiceLayer: ServiceLayerProtocol {
    
    // MARK: - Shared
    
    static let shared = ServiceLayer()
    
    // MARK: - Public Properties
    
    var authorizationService: AuthorizationServiceProtocol
    var feedService: FeedServiceProtocol
    var profileService: ProfileServiceProtocol
    
    // MARK: - Initialization

    init() {
        self.authorizationService = AuthorizationService()
        self.feedService = FeedService()
        self.profileService = ProfileService()
    }
    
}
