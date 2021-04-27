//
//  DislikePostEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct DislikePostEndpoint: EmptyEndpoint {
    
    private let id: String
    
    public init(id: String) {
        self.id = id
    }
    
    public func makeRequest() throws -> URLRequest {
        guard let url = URL(string: "feed/\(id)/like")
        else { throw APIError.parametersInvalid }
        
        return delete(url)
    }

}
