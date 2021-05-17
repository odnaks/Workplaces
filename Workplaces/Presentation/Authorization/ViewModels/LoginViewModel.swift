//
//  LoginViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

public struct LoginViewModel {
    
    // MARK: - Public Properties
    
    let email: String
    let password: String
    
    // MARK: - Initialization
    
    public init(
        email: String,
        password: String
    ) {
        self.email = email
        self.password = password
    }
}
