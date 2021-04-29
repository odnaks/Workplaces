//
//  ChangeProfileEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct ChangeProfileEndpoint: JsonEndpoint {
    
    public typealias Content = UserProfile
    
    private let profileChanging: RequestProfile

    public init(profile: RequestProfile) {
        self.profileChanging = profile
    }
    
    public func makeRequest() throws -> URLRequest {
        let bodyData = try JSONEncoder.default.encode(profileChanging)
        return patch(
            API.me,
            body: HTTPBody.json(bodyData)
        )
    }

}
