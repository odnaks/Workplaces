//
//  SearchPostEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class SearchPostEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let postData = "postDataTest"
        let endpoint = SearchPostEndpoint(postData: postData)
        
        let urlRequest = try endpoint.makeRequest()
        assertGET(urlRequest)
        assertURL(
            urlRequest,
            API.search
                .appending("post", value: postData)!
                .absoluteString
        )
    }

}
