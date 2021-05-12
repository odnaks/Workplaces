//
//  AuthorizationServiceTest.swift
//  WorkplacesTests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Apexy
@testable import Workplaces
import WorkplacesAPI
import XCTest

final class AuthorizationServiceTests: XCTestCase {
    
    // MARK: - Private Properties
    
    private var autorizationService: AuthorizationService!
    private var mockStorage: MockCredentialsStorage!
    
    // MARK: - SetUp
    
    override func setUp() {
        super.setUp()
        
        let stubClient = StubApiClient()
        mockStorage = MockCredentialsStorage()

        autorizationService = AuthorizationService(
            apiClient: stubClient,
            credentialsStorage: mockStorage
        )
    }
    
    // MARK: - Tests

    func testSaveTokenAfterRegistration() throws {
        mockStorage.token = nil
        
        _ = autorizationService.registration(
            with: UserCredentials.dummyObject,
            completion: { _ in }
        )
        
        XCTAssertNotNil(mockStorage.token)
    }
    
    func testSaveTokenAfterLogin() throws {
        mockStorage.token = nil
        
        _ = autorizationService.login(
            with: UserCredentials.dummyObject,
            completion: { _ in }
        )
        
        XCTAssertNotNil(mockStorage.token)
    }
    
    func testSaveTokenAfterRefresh() throws {
        mockStorage.token = nil
        
        _ = autorizationService.refresh(
            completion: { _ in }
        )
        
        XCTAssertNotNil(mockStorage.token)
    }

}
