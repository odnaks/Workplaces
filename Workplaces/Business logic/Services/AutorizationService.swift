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
    private let credentialsStorage: TokenStorageProtocol
    
    // MARK: - Initialization
    
    init(
        apiClient: Client,
        credentialsStorage: TokenStorageProtocol
    ) {
        self.apiClient = apiClient
        self.credentialsStorage = credentialsStorage
    }
    
    // MARK: - Public Methods
    
    func registration(
        with userCredentials: UserCredentials,
        completion: @escaping (Result<Token, AuthorizationError>) -> Void
    ) -> Progress {
        let endpoint = RegistrationEndpoint(userCredentials: userCredentials)
        return apiClient.request(endpoint) { result in
            switch result {
            case .success(let token):
                self.save(token)
                completion(.success(token))
            case .failure(let error):
                let apiError = error.unwrapAFError()
                let authorizationError = AuthorizationError.mapToAuthorizationError(from: apiError)
                completion(.failure(authorizationError))
            }
        }
    }
    
    func login(
        with userCredentials: UserCredentials,
        completion: @escaping (Result<Token, AuthorizationError>) -> Void
    ) -> Progress {
        let endpoint = LoginEndpoint(userCredentials: userCredentials)
        return apiClient.request(endpoint) { result in
            switch result {
            case .success(let token):
                self.save(token)
                completion(.success(token))
            case .failure(let error):
                let apiError = error.unwrapAFError()
                let authorizationError = AuthorizationError.mapToAuthorizationError(from: apiError)
                completion(.failure(authorizationError))
            }
        }
    }
    
    func checkLogin() -> Bool {
        return !(credentialsStorage.token?.accessToken.isEmpty ?? true)
    }
    
    func logout(
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = LogoutEndpoint()
        return apiClient.request(endpoint) { result in
            
            completion(result)
        }
    }
    
    // MARK: - Private Methods
    
    private func save(_ token: Token) {
        credentialsStorage.token = token
    }
    
    private func clean() {
        let nilToken = Token(
            accessToken: "",
            refreshToken: ""
        )
        credentialsStorage.token = nilToken
    }
}
