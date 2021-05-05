//
//  LogoutEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class LogoutEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let endpoint = LogoutEndpoint()
        
        let urlRequest = try endpoint.makeRequest()
        assertPOST(urlRequest)
        assertURL(urlRequest, API.logout.absoluteString)
    }

}
