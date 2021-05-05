//
//  FakeModel.swift
//  WorkplacesAPITests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

struct FakeModel: Codable, Equatable {
    
    public let stringProperty: String
    public let doubleProperty: Double
    
    static let testContent = FakeModel(
        stringProperty: "test",
        doubleProperty: 42.0
    )
}
