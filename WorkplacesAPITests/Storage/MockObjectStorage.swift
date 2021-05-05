//
//  MockObjectStorage.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

@testable import WorkplacesAPI

final class MockObjectStorage: ObjectStorage {
    var object: Any?
    
    init() {}
    
    func set<T: Codable>(_ object: T, for key: String) {
        self.object = object
    }
    
    func object<T: Codable>(for key: String) -> T? {
        return object as? T
    }
}
