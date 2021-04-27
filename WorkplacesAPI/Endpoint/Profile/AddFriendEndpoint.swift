//
//  AddFriendEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct AddFriendEndpoint: EmptyEndpoint {
    
    private let userId: String

    public init(friendId: String) {
        self.userId = friendId
    }
    
    public func makeRequest() throws -> URLRequest {
        let userIdDic = ["user_id": userId]
        let jsonData = try JSONSerialization.data(
            withJSONObject: userIdDic,
            options: .prettyPrinted
        )
        return post(
            API.friends,
            body: HTTPBody.json(jsonData)
        )
    }

}
