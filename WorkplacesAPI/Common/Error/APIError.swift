//
//  APIError.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.04.2021.
//

import Foundation

/// Error from API.
public struct APIError: Codable, Error {

    // MARK: - Public Properties
    
    public let code: Code
    public let description: String?
    public let message: String?

    // MARK: - Initialization
    
    public init(
        code: Code,
        description: String? = nil,
        message: String? = nil
    ) {
        self.code = code
        self.description = description
        self.message = message
    }
    
}

extension APIError: Equatable {}

// MARK: - General Error Code

extension APIError {
    
    /// Invalid Parameters Error
    public static let parametersInvalid = APIError(code: .unknownError, message: "Paramenters invalid")
}
