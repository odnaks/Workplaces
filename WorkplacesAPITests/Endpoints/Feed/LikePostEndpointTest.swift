//
//  LikePostEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class LikePostEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let id = "testID"
        let endpoint = LikePostEndpoint(id: id)
        
        let urlRequest = try endpoint.makeRequest()
        assertPOST(urlRequest)
        assertURL(
            urlRequest,
            API.feed
                .appendingPathComponent(id)
                .appendingPathComponent("like")
                .absoluteString
        )
        
    }

}
