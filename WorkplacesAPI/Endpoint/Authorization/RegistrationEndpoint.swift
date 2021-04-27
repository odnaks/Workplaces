//
//  RegistrationEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Apexy

public struct RegistrationEndpoint: JsonEndpoint {
    
    public typealias Content = Token
    
    private let userCredentials: UserCredentials

    public init(userCredentials: UserCredentials) {
        self.userCredentials = userCredentials
    }
    
    public func makeRequest() throws -> URLRequest {
        let bodyData = try JSONEncoder().encode(userCredentials)
        return post(
            API.registration,
            body: HTTPBody.json(bodyData)
        )
    }

}
