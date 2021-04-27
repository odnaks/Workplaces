//
//  ProfilePostsEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct ProfilePostsEndpoint: JsonEndpoint {
    
    public typealias Content = [Post]

    public init() {}
    
    public func makeRequest() throws -> URLRequest {
        return get(API.posts)
    }

}
