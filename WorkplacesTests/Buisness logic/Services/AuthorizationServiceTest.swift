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
        mockStorage.hasBeenSet = false
        
        _ = autorizationService.registration(
            with: UserCredentials.dummyObject,
            completion: { _ in }
        )
        
        XCTAssertTrue(mockStorage.hasBeenSet)
    }
    
    func testSaveTokenAfterLogin() throws {
        mockStorage.hasBeenSet = false
        
        _ = autorizationService.login(
            with: UserCredentials.dummyObject,
            completion: { _ in }
        )
        
        XCTAssertTrue(mockStorage.hasBeenSet)
    }
    
    func testSaveTokenAfterRefresh() throws {
        mockStorage.hasBeenSet = false
        
        _ = autorizationService.refresh(
            completion: { _ in }
        )
        
        XCTAssertTrue(mockStorage.hasBeenSet)
    }

}
