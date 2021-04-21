//
//  ServiceLayer.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import Foundation

final class ServiceLayer {
    
    // MARK: - Shared
    
    static let shared = ServiceLayer()
    
    // MARK: - Public Properties
    
    let authorizationService: AuthorizationServiceProtocol
    let feedService: FeedServiceProtocol
    let profileService: ProfileServiceProtocol
    
    // MARK: - Initialization

    private init() {
        authorizationService = AuthorizationService()
        feedService = FeedService()
        profileService = ProfileService()
    }
    
}
