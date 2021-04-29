//
//  Post.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.04.2021.
//

import Foundation

public struct Post: Decodable {
    
    // MARK: - Public Properties
    
    public let id: String
    public let text: String?
    public let imageUrl: URL?
    public let lon: Double?
    public let lat: Double?
    public let author: UserProfile
    public let likes: Int
    
}
