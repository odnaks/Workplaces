//
//  RequestProfile.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public struct RequestProfile: Encodable {
    
    // MARK: - Public Properties
    
    public let firstName: String?
    public let lastName: String?
    public let nickname: String?
    public let avatarFile: String?
    public let birthDay: String?
    
    public init(
        firstName: String? = nil,
        lastName: String? = nil,
        nickname: String? = nil,
        avatarFile: String? = nil,
        birthDay: String? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.nickname = nickname
        self.avatarFile = avatarFile
        self.birthDay = birthDay
    }
}
