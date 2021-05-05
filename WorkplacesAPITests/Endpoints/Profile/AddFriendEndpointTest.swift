//
//  AddFriendEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class AddFriendEndpointTests: XCTestCase {

    // MARK: - Tests
    
    func testMakeRequest() throws {
        let id = "testID"
        
        let endpoint = AddFriendEndpoint(friendId: id)
        
        let urlRequest = try endpoint.makeRequest()
        assertPOST(urlRequest)
        assertURL(urlRequest, API.friends.absoluteString)
        
        let userIdDic = ["user_id": id]
        let jsonData = try JSONSerialization.data(
            withJSONObject: userIdDic,
            options: .prettyPrinted
        )
        assertJsonBody(urlRequest, HTTPBody.json(jsonData))
    }

}
