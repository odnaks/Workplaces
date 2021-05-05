//
//  StubApiClient.swift
//  WorkplacesTests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Apexy
@testable import Workplaces
import WorkplacesAPI

class StubApiClient: Client {
    func request<T>(
        _ endpoint: T,
        completionHandler: @escaping (APIResult<T.Content>) -> Void
    ) -> Progress where T: Endpoint {
        if let dummyData = try? JSONEncoder().encode(Token.dummyObject),
           let content = try? endpoint.content(from: nil, with: dummyData) {
            completionHandler(.success(content))
        } else {
            completionHandler(.failure(APIError.testError))
        }
        
        return Progress()
    }
    
    func upload<T>(
        _ endpoint: T,
        completionHandler: @escaping (APIResult<T.Content>) -> Void
    ) -> Progress
    where
        T: UploadEndpoint {
        return Progress()
    }
}
