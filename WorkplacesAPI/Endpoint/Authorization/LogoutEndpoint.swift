//
//  LogoutEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Apexy

public struct LogoutEndpoint: EmptyEndpoint {
    
    public init() {}
    
    public func makeRequest() throws -> URLRequest {
        return post(API.logout)
    }

}
