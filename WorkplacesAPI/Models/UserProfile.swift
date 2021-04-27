//
//  UserProfile.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 24.04.2021.
//

import Foundation

public struct UserProfile: Decodable, Identifiable {
    
    // MARK: - Public Properties
    
    public let id: String
    public let firstName: String
    public let lastName: String
    public let nickname: String?
    public let avatarUrl: String?
    public let birthDay: String
    
}
