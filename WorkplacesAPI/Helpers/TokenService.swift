//
//  TokenService.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 01.06.2021.
//

import Apexy

public final class TokenService: TokenServiceProtocol {
    
    // MARK: - Private Properties
    
    private let apiClient: Client
    private let credentialsStorage: TokenStorageProtocol
    
    // MARK: - Initialization
    
    public init(
        apiClient: Client,
        credentialsStorage: TokenStorageProtocol
    ) {
        self.apiClient = apiClient
        self.credentialsStorage = credentialsStorage
    }
    
    // MARK: - Public Methods
    
    public func refresh(
        with token: String,
        completion: @escaping (Bool) -> Void
    ) -> Progress {
        let endpoint = RefreshEndpoint(token: token)
        return apiClient.request(endpoint) { result in
            switch result {
            case .success(let token):
                self.save(token.accessToken)
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func save(_ accessToken: String) {
        credentialsStorage.accessToken = accessToken
    }
}
