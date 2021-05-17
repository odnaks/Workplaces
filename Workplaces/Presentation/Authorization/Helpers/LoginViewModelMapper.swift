//
//  LoginViewModelMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import WorkplacesAPI

extension LoginViewModel {
    
    /// Метод для маппинга данных из LoginViewModel в UserCredentials
    public static func mapToUserCredentials(from data: LoginViewModel) -> UserCredentials {
        return UserCredentials(
            email: data.email,
            password: data.password
        )
    }
    
}
