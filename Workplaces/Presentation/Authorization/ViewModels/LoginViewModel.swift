//
//  LoginViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

struct LoginViewModel {
    
    // MARK: - Public Properties
    
    let email: String
    let password: String
    
    // MARK: - Initialization
    
    init(
        email: String,
        password: String
    ) {
        self.email = email
        self.password = password
    }
}
