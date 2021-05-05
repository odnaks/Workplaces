//
//  ProfilePostsEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class ProfilePostsEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let endpoint = ProfilePostsEndpoint()
        
        let urlRequest = try endpoint.makeRequest()
        assertGET(urlRequest)
        assertURL(urlRequest, API.posts.absoluteString)
    }

}
