//
//  ProfileEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct ProfileEndpoint: JsonEndpoint {
    
    public typealias Content = UserProfile
    
    public init() {}
    
    public func makeRequest() throws -> URLRequest {
        return get(API.me)
    }

}
