//
//  URLRequestBuildable+Bearer.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Apexy

public extension URLRequestBuildable {
    
    /// Create HTTP POST request.
    ///
    /// - Parameters:
    ///   - url: Request URL.
    ///   - queryItems: Request parameters.
    /// - Returns: HTTP GET Request.
    func post(_ url: URL, queryItems: [URLQueryItem]? = nil) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data", forHTTPHeaderField: "Content-Type")
        
        guard let queryItems = queryItems, !queryItems.isEmpty else {
            return request
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = queryItems

        return request
    }
    
}
