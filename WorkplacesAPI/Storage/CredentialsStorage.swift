//
//  CredentialsStorage.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public final class CredentialsStorage: CredentialsStorageProtocol {
    
    // MARK: - Private properties
    
    private let storage: ObjectStorage
    
    // MARK: - Public methods
    
    public func save(_ token: Token) {
        storage.set(token, for: "token")
    }
    
    public func getToken() -> Token? {
        guard let token: Token = storage.object(for: "token") else { return nil }
        
        return token
    }
    
    // MARK: - Initialization
    
    public init(
        storage: ObjectStorage = UserDefaults.standard
    ) {
        self.storage = storage
    }
    
}
