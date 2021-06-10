//
//  ThreadSafeStorage.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 01.06.2021.
//

import Foundation

final class ThreadSafeStorage<Key: Hashable, Value> {
    
    // MARK: - Private properties
    
    private var dict: [Key: Value] = [:]
    private let queue = DispatchQueue(label: "storageQueue")
    
    // MARK: - Public methods
    
    func setValue(_ value: Value?, for key: Key) {
        queue.sync {
            dict[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
        return queue.sync {
            dict[key]
        }
    }
}
