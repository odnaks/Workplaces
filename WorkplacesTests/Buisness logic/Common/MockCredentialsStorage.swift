//
//  MockCredentialsStorage.swift
//  WorkplacesTests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import WorkplacesAPI

class MockCredentialsStorage: CredentialsStorageProtocol {
    
    // MARK: - Public Properties
    
    var token: Token? {
        get {
            return privateToken
        }
        set {
            privateToken = newValue
        }
    }
    
    // MARK: - Private Properties
    
    private var privateToken: Token?
}
