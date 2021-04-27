//
//  FriendsEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct FriendsEndpoint: JsonEndpoint {
    
    public typealias Content = [UserProfile]
    
    public init() {}
    
    public func makeRequest() throws -> URLRequest {
        return get(API.friends)
    }

}
