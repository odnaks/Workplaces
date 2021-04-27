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
        try ResponseValidator.validate(response, with: body)
        let resource = try JSONDecoder.default.decode(Content.self, from: body)
        return resource
    }
}
