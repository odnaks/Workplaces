//
//  DeleteFriendEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct DeleteFriendEndpoint: EmptyEndpoint {
    
    private let userId: String

    public init( friendId: String) {
        self.userId = friendId
    }
    
    public func makeRequest() throws -> URLRequest {
        guard let url = URL(string: "me/\(userId)")
        else { throw APIError.parametersInvalid }
        
        return delete(url)
    }

}
