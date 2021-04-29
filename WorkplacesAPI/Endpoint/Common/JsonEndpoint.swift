//
//  JsonEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Apexy

/// Base Endpoint for application remote resource.
///
/// Contains shared logic for all endpoints in app.
protocol JsonEndpoint: Endpoint, URLRequestBuildable where Content: Decodable {}

extension JsonEndpoint {

    public func content(from response: URLResponse?, with body: Data) throws -> Content {
        let resource = try JSONDecoder.default.decode(Content.self, from: body)
        return resource
    }
    
    public func validate(_ request: URLRequest?, response: HTTPURLResponse, data: Data?) throws {
        try ResponseValidator.validate(response, with: data)
    }
}
