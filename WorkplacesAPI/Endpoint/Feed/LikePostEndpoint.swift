//
//  LikePostEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct LikePostEndpoint: EmptyEndpoint {
    
    private let id: String
    
    public init(id: String) {
        self.id = id
    }
    
    public func makeRequest() throws -> URLRequest {
        let url = API.feed
            .appendingPathComponent(id)
            .appendingPathComponent("like")
        
        return post(url)
    }

}
