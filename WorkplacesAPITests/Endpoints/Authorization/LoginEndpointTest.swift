//
//  LoginEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class LoginEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let userCredentials = UserCredentials.dummyObject
        
        let endpoint = LoginEndpoint(userCredentials: userCredentials)
        
        let urlRequest = try endpoint.makeRequest()
        assertPOST(urlRequest)
        assertURL(urlRequest, API.login.absoluteString)
        
        let bodyData = try JSONEncoder.default.encode(userCredentials)
        assertJsonBody(urlRequest, HTTPBody.json(bodyData))
    }

}
