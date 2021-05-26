//
//  RegistrationViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

struct RegistrationViewModel {
    
    // MARK: - Public Properties
    
    let email: String
    let password: String
    var nickName: String?
    var firstName: String?
    var lastName: String?
    var birthday: Date?
    
    // MARK: - Initialization
    
    init(
        email: String,
        password: String
    ) {
        self.email = email
        self.password = password
    }
}
