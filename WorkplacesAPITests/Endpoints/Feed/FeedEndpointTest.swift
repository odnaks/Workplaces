//
//  FeedEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class FeedEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let endpoint = FeedEndpoint()
        
        let urlRequest = try endpoint.makeRequest()
        assertGET(urlRequest)
        assertURL(urlRequest, API.feed.absoluteString)
        
    }

}
