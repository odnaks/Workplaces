//
//  SearchUserEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct SearchUserEndpoint: JsonEndpoint {
    
    public typealias Content = [UserProfile]
    
    private let userData: String
    
    public init(userData: String) {
        self.userData = userData
    }
    
    public func makeRequest() throws -> URLRequest {
        guard let url = API.search.appending("user", value: userData)
        else { throw APIError.parametersInvalid }
        
        return get(url)
    }

}
