//
//  MockCredentialsStorage.swift
//  WorkplacesTests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import WorkplacesAPI

class MockCredentialsStorage: CredentialsStorageProtocol {
    
    // MARK: - Public Properties
    
    public var hasBeenSet: Bool = false
    
    // MARK: - Private Properties
    
    private var privateToken: Token?
    
    var token: Token? {
        get {
            return privateToken
        }
        set {
            hasBeenSet = true
            privateToken = newValue
        }
    }
}
