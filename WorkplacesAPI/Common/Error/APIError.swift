//
//  APIError.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.04.2021.
//

import Foundation

/// Error from API.
public struct APIError: Decodable, Error {

    // MARK: - Public Properties
    
    public let code: String
    public let description: String?
    public let message: String?

    // MARK: - Initialization
    
    public init(
        code: String,
        description: String? = nil,
        message: String? = nil
    ) {
        self.code = code
        self.description = description
        self.message = message
    }
}

// MARK: - General Error Code

extension APIError {
    
    /// Invalid Parameters Error
    public static let parametersInvalid = APIError(code: "INVALID_PARAMETERS", message: "Paramenters invalid")

}
