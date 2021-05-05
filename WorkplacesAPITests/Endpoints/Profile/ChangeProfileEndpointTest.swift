//
//  ChangeProfileEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class ChangeProfileEndpointTests: XCTestCase {
    
    // MARK: - Tests
    
    func testMakeRequest() throws {
        let profileChanging = RequestProfile.dummyObject
        
        let endpoint = ChangeProfileEndpoint(profile: profileChanging)
        
        let urlRequest = try endpoint.makeRequest()
        assertPATCH(urlRequest)
        assertURL(urlRequest, API.me.absoluteString)
        
        let bodyData = try JSONEncoder.default.encode(profileChanging)
        assertJsonBody(urlRequest, HTTPBody.json(bodyData))
    }

}
