//
//  ProfileEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class ProfileEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let endpoint = ProfileEndpoint()
        
        let urlRequest = try endpoint.makeRequest()
        assertGET(urlRequest)
        assertURL(urlRequest, API.me.absoluteString)
        
    }

}
