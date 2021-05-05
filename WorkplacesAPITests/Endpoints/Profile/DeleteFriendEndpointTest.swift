//
//  DeleteFriendEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class DeleteFriendEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let id = "testID"
        
        let endpoint = DeleteFriendEndpoint(friendId: id)
        
        let urlRequest = try endpoint.makeRequest()
        assertDELETE(urlRequest)
        assertURL(
            urlRequest, API.me
                .appendingPathComponent(id)
                .absoluteString
        )
    }

}
