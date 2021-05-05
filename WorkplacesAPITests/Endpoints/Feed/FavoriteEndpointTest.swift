//
//  FavoriteEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class FavoriteEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let endpoint = FavoriteEndpoint()
        
        let urlRequest = try endpoint.makeRequest()
        assertGET(urlRequest)
        assertURL(urlRequest, API.favorite.absoluteString)
    }

}
