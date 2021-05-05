//
//  AutorizationService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import Apexy
import WorkplacesAPI

final class AuthorizationService: AuthorizationServiceProtocol {
    
    // MARK: - Private Properties
    
    private let apiClient: Client
    private let credentialsStorage: CredentialsStorageProtocol
    
    // MARK: - Initialization
    
    init(
        apiClient: Client,
        credentialsStorage: CredentialsStorageProtocol
    ) {
        self.apiClient = apiClient
        self.credentialsStorage = credentialsStorage
    }
    
    // MARK: - Public Methods
    
    public func registration(
        with userCredentials: UserCredentials,
        completion: @escaping (Result<Token, Error>) -> Void
    ) -> Progress {
        let endpoint = RegistrationEndpoint(userCredentials: userCredentials)
        return apiClient.request(endpoint) { result in
            switch result {
            case .success(let token):
                self.save(token)
            case .failure:
                break
            }
            completion(result)
        }
    }
    
    public func login(
        with userCredentials: UserCredentials,
        completion: @escaping (Result<Token, Error>) -> Void
    ) -> Progress {
        let endpoint = RegistrationEndpoint(userCredentials: userCredentials)
        return apiClient.request(endpoint) { result in
            switch result {
            case .success(let token):
                self.save(token)
            case .failure:
                break
            }
            completion(result)
        }
    }
    
    public func logout(
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = LogoutEndpoint()
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    public func refresh(
        completion: @escaping (Result<Token, Error>) -> Void
    ) -> Progress {
        let token = credentialsStorage.token
        let endpoint = RefreshEndpoint(token: token)
        return apiClient.request(endpoint) { result in
            switch result {
            case .success(let token):
                self.save(token)
            case .failure:
                break
            }
            completion(result)
        }
    }
    
    // MARK: - Private Methods
    
    private func save(_ token: Token) {
        credentialsStorage.token = token
    }
}
