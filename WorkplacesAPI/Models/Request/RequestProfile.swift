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
    public let avatarFile: Data?
    public let birthDay: String?
}
