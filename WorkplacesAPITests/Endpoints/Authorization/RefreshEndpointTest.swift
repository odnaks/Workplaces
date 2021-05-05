//
//  RefreshEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class RefreshEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let token = Token.dummyObject
        
        let endpoint = RefreshEndpoint(token: token)
        
        let urlRequest = try endpoint.makeRequest()
        assertPOST(urlRequest)
        assertURL(urlRequest, API.refresh.absoluteString)
        
        let refreshTokenDic = ["refresh_token": token.refreshToken]
        let jsonData = try JSONSerialization.data(
            withJSONObject: refreshTokenDic,
            options: .prettyPrinted
        )
        assertJsonBody(urlRequest, HTTPBody.json(jsonData))
    }

}
