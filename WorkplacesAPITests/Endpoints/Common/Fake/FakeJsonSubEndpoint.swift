//
//  FakeJsonSubEndpoint.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

@testable import WorkplacesAPI

struct FakeJsonSubEndpoint: JsonEndpoint {

    public typealias Content = FakeModel
    
    public init() {}

    func makeRequest() throws -> URLRequest {
        return get(API.test)
    }
}
