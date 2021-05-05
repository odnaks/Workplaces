//
//  SearchUserEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class SearchUserEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let userData = "userDataTest"
        let endpoint = SearchUserEndpoint(userData: userData)
        
        let urlRequest = try endpoint.makeRequest()
        assertGET(urlRequest)
        assertURL(
            urlRequest,
            API.search
                .appending("user", value: userData)!
                .absoluteString
        )
    }

}
