//
//  Token.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.04.2021.
//

import Foundation

public struct Token: Codable {
    
    // MARK: - Public Properties
    
    public let accessToken: String
    public let refreshToken: String
    
}
