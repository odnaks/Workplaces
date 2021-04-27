//
//  UserCredentials.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.04.2021.
//

import Foundation

public struct UserCredentials: Encodable {
    
    // MARK: - Public Properties
    
    public let email: String
    public let password: String
    
    // MARK: - Initialization
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
