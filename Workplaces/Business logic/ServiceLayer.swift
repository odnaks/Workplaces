//
//  ServiceLayer.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import Apexy
import WorkplacesAPI

final class ServiceLayer {
    
    // MARK: - Shared
    
    static let shared = ServiceLayer()
    
    // MARK: - Public Properties
    
    lazy var authorizationService: AuthorizationServiceProtocol = AuthorizationService(
        apiClient: apiClient,
        credentialsStorage: credentialsStorage
    )
    lazy var feedService: FeedServiceProtocol = FeedService(apiClient: apiClient)
    lazy var profileService: ProfileServiceProtocol = ProfileService(apiClient: apiClient)
    lazy var tokenService: TokenServiceProtocol = TokenService(
        apiClient: apiClient,
        credentialsStorage: credentialsStorage
    )
    lazy var securitySerice: SecurityServiceProtocol = SecurityService()
    
    // MARK: - Private Properties
    
    private lazy var credentialsStorage: TokenStorageProtocol = TokenStorage()
    
    private lazy var retryManager: RetryManagerProtocol = RetryManager(
        tokenService: { self.tokenService }
    )
    
    private lazy var interceptor: BearerRequestInterceptor = BearerRequestInterceptor(
        baseURL: URL(string: "https://interns2021.redmadrobot.com/")!,
        credentialsStorage: credentialsStorage,
        retryManager: retryManager
    )
    
    private lazy var apiClient: Client = AlamofireClient(
        requestInterceptor: interceptor,
        configuration: .ephemeral
    )

}
