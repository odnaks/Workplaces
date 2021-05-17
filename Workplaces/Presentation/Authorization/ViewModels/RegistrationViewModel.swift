//
//  RegistrationViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

public struct RegistrationViewModel {
    
    // MARK: - Public Properties
    
    let email: String
    let password: String
    let nickName: String?
    let firstName: String?
    let lastName: String?
    let date: Date?
    
    // MARK: - Initialization
    
    public init(
        email: String,
        password: String,
        nickName: String? = nil,
        firstName: String? = nil,
        lastName: String? = nil,
        date: Date? = nil
    ) {
        self.email = email
        self.password = password
        self.nickName = nickName
        self.firstName = firstName
        self.lastName = lastName
        self.date = date
    }
}
