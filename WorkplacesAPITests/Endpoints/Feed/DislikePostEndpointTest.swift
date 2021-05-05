//
//  DislikePostEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class DisikePostEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let id = "testID"
        let endpoint = DislikePostEndpoint(id: id)
        
        let urlRequest = try endpoint.makeRequest()
        assertDELETE(urlRequest)
        assertURL(
            urlRequest,
            API.feed
                .appendingPathComponent(id)
                .appendingPathComponent("like")
                .absoluteString
        )
        
    }

}
