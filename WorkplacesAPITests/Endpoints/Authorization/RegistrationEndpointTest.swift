//
//  RegistrationEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class RegistationEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let userCredentials = UserCredentials.dummyObject
        
        let endpoint = RegistrationEndpoint(userCredentials: userCredentials)
        
        let urlRequest = try endpoint.makeRequest()
        assertPOST(urlRequest)
        assertURL(urlRequest, API.registration.absoluteString)
        
        let bodyData = try JSONEncoder.default.encode(userCredentials)
        assertJsonBody(urlRequest, HTTPBody.json(bodyData))
    }

}
