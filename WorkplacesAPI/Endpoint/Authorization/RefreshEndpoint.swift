//
//  RefreshEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Apexy

public struct RefreshEndpoint: JsonEndpoint {
    
    public typealias Content = Token
    
    private let refreshToken: String?
    
    public init(token: String?) {
        self.refreshToken = token
    }
    
    public func makeRequest() throws -> URLRequest {
        let refreshTokenDic = ["refresh_token": refreshToken!]
        
        let jsonData = try JSONSerialization.data(
            withJSONObject: refreshTokenDic,
            options: .prettyPrinted
        )
        return post(
            API.refresh,
            body: HTTPBody.json(jsonData)
        )
    }

}
