//
//  JSONEndpointTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 03.05.2021.
//

import Apexy
@testable import WorkplacesAPI
import XCTest

final class JsonEndpointTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var fakeEndpoint: FakeJsonSubEndpoint!
    
    // MARK: - SetUp
    
    override func setUp() {
        super.setUp()
        
        fakeEndpoint = FakeJsonSubEndpoint()
    }
    
    // MARK: - Tests
    
    func testContent() throws {
        let fakeContent = FakeModel.testContent
        
        let data = try JSONEncoder.default.encode(fakeContent)
        let content = try fakeEndpoint.content(from: nil, with: data)
        XCTAssertEqual(content, fakeContent)
    }
    
    func testValidateAPIError() throws {
        let apiError = APIError.testError
        
        let errorData = try JSONEncoder.default.encode(apiError)
        
        XCTAssertThrowsError(
            try fakeEndpoint.validate(
                nil,
                response: HTTPURLResponse(),
                data: errorData
            ),
            "Not validate APIError"
        ) { error in
            guard let error = error as? APIError
            else { XCTFail("Error is not APIError"); return }
            
            XCTAssertEqual(error, apiError)
        }
        
    }
    
    func testValidateHTTPError() throws {
        let response = HTTPURLResponse(
            url: API.test,
            statusCode: 404,
            httpVersion: nil,
            headerFields: nil
        )!
        
        XCTAssertThrowsError(
            try fakeEndpoint.validate(
                nil,
                response: response,
                data: nil
            ),
            "Not validate HTTPError"
        ) { error in
            guard let error = error as? HTTPError
            else { XCTFail("Error is not APIError"); return }
            
            XCTAssertEqual(error.statusCode, response.statusCode)
        }
    }

}
