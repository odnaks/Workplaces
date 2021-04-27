//
//  ObjectStorage.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public protocol ObjectStorage: AnyObject {
    func set<T: Codable>(_ object: T, for key: String)
    func object<T: Codable>(for key: String) -> T?
}

extension UserDefaults: ObjectStorage {
    
    public func set<T: Codable>(_ object: T, for key: String) {
        guard let encodedObject = try? JSONEncoder().encode(object) else { return }
        
        UserDefaults.standard.set(encodedObject, forKey: key)
    }
    
    public func object<T: Codable>(for key: String) -> T? {
        guard let objectData = UserDefaults.standard.object(forKey: key) as? Data,
              let object = try? JSONDecoder().decode(T.self, from: objectData)
        else { return nil }
        
        return object
    }
    
}
