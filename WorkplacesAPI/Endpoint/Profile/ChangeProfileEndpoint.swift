//
//  ChangeProfileEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Alamofire
import Apexy

public struct ChangeProfileEndpoint: JsonEndpoint {
    
    public typealias Content = UserProfile
    
    private let profileChanging: RequestProfile

    public init(profile: RequestProfile) {
        self.profileChanging = profile
    }
    
    public func makeRequest() throws -> URLRequest {
        let multipartForm = MultipartFormData()
        multipartForm.append(profileChanging.firstName?.data(using: .utf8) ?? Data(), withName: "first_name")
        multipartForm.append(profileChanging.lastName?.data(using: .utf8) ?? Data(), withName: "last_name")
        multipartForm.append(profileChanging.nickname?.data(using: .utf8) ?? Data(), withName: "nickname")
        multipartForm.append(profileChanging.birthDay?.data(using: .utf8) ?? Data(), withName: "birth_day")
        
        return patch(
            API.me,
            body: HTTPBody.multipart(try multipartForm.encode(), boundary: multipartForm.boundary)
        )
    }

}
