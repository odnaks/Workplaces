//
//  HTTPError.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Foundation

/// Error from HTTP.
public struct HTTPError: Error {
    
    // MARK: - Public Properties
    
    public let statusCode: Int
    public let url: URL?

    public var localizedDescription: String {
        return HTTPURLResponse.localizedString(forStatusCode: statusCode)
    }
}
