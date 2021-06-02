//
//  CredentialsStorageTest.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

@testable import WorkplacesAPI
import XCTest

final class CredentialsStorageTest: XCTestCase {
    
    // MARK: - Private Properties
    
    private var objectStorage: MockObjectStorage!
    private var credentialsStorage: TokenStorage!
    
    // MARK: - SetUp
    
    override func setUp() {
        super.setUp()
        
        objectStorage = MockObjectStorage()
        credentialsStorage = TokenStorage(
            storage: objectStorage
        )
    }
    
    // MARK: - Tests
    
    func testSaveToken() throws {
        let token = Token.dummyObject
        
        credentialsStorage.token = token
        
        guard let object = objectStorage.object as? Token
        else { XCTFail("Object in storage is not Token Model"); return }
        
        XCTAssertEqual(token, object)
    }
    
    func testGetToken() throws {
        let token = Token.dummyObject
        objectStorage.object = token
        
        let recievedToken = credentialsStorage.token
        XCTAssertEqual(recievedToken, token)
    }
}
