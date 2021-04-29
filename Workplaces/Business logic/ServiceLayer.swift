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
    
    let authorizationService: AuthorizationServiceProtocol
    let feedService: FeedServiceProtocol
    let profileService: ProfileServiceProtocol
    
    // MARK: - Initialization

    private init() {
        
        let credentialsStorage: CredentialsStorage = CredentialsStorage()
        
        let apiClient: Client = AlamofireClient(
            requestInterceptor: BearerRequestInterceptor(
                baseURL: URL(string: "https://interns2021.redmadrobot.com/")!,
                credentialsStorage: credentialsStorage
            ),
            configuration: .ephemeral
        )
        
        authorizationService = AuthorizationService(
            apiClient: apiClient,
            credentialsStorage: credentialsStorage
        )
        feedService = FeedService(apiClient: apiClient)
        profileService = ProfileService(apiClient: apiClient)
    }

}
