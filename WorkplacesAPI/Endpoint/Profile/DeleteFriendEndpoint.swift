//
//  DeleteFriendEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct DeleteFriendEndpoint: EmptyEndpoint {
    
    private let userId: String

    public init(friendId: String) {
        self.userId = friendId
    }
    
    public func makeRequest() throws -> URLRequest {
        let url = API.me.appendingPathComponent(userId)
        
        return delete(url)
    }

}
