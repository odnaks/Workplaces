//
//  ResponseValidator.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Foundation

/// Response validation helper.
internal enum ResponseValidator {

    /// Error response validation.
    ///
    /// - Parameters:
    ///   - response: The metadata associated with the response.
    ///   - body: The response body.
    /// - Throws: `Error`.
    internal static func validate(_ response: URLResponse?, with body: Data?) throws {
        try validateAPIResponse(body)
        try validateHTTPstatus(response)
    }
    
    // MARK: - Private Properties

    private static func validateAPIResponse(_ body: Data?) throws {
        guard let data = body,
              let error = try? JSONDecoder.default.decode(APIError.self, from: data)
              else { return }
        throw error
    }

    private static func validateHTTPstatus(_ response: URLResponse?) throws {
        guard let httpResponse = response as? HTTPURLResponse,
            !(200..<300).contains(httpResponse.statusCode) else { return }
        throw HTTPError(statusCode: httpResponse.statusCode, url: httpResponse.url)
    }
}
