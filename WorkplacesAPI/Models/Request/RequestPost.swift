//
//  RequestPost.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public struct RequstPost {
    
    // MARK: - Public Properties
    
    public let text: String
    public let lon: Double
    public let lat: Double
    public let imageFile: Data?
    
    // MARK: - Initialization
    
    public init(text: String, lon: Double, lat: Double) {
        self.text = text
        self.lon = lon
        self.lat = lat
        self.imageFile = nil
    }
}
