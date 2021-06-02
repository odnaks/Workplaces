//
//  TokenStorage.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public final class TokenStorage: TokenStorageProtocol {
    
    // MARK: - Private properties
    
    private let storage: ObjectStorage
    private let serialQueue: DispatchQueue
    
    // MARK: - Initialization
    
    public init(
        storage: ObjectStorage = UserDefaults.standard
    ) {
        self.storage = storage
        self.serialQueue = DispatchQueue(label: "serialTokenRefreshQueue", qos: .utility)
    }
    
    // MARK: - Public properties
    
    public var token: Token? {
        get {
            return getToken()
        }
        
        set {
            save(newValue)
        }
    }
    
    // MARK: - Private methods
    
    private func save(_ token: Token?) {
        guard let token = token else { return }
        
        serialQueue.sync {
            storage.set(token, for: "token")
        }
    }
    
    private func getToken() -> Token? {
        serialQueue.sync {
            guard let token: Token = storage.object(for: "token") else { return nil }
            
            return token
        }
    }
    
}
