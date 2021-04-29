//
//  EmptyEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Apexy

/// Empty Body Request Enpoint.
protocol EmptyEndpoint: Endpoint, URLRequestBuildable where Content == Void {}

extension EmptyEndpoint {
    
    public func content(from response: URLResponse?, with body: Data) throws -> Content { }
    
    public func validate(_ request: URLRequest?, response: HTTPURLResponse, data: Data?) throws {
        try ResponseValidator.validate(response, with: data)
    }
}
