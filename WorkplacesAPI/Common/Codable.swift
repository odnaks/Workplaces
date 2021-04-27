//
//  Codable.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.04.2021.
//

import Foundation

public extension JSONDecoder {
    internal static let `default`: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

public extension JSONEncoder {
    internal static let `default`: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        return encoder
    }()
}
