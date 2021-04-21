//
//  AutorizationService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import Foundation

final class AuthorizationService: AuthorizationServiceProtocol {
    
    // MARK: - Initialization
    
    init() {
        //
    }
    
    // MARK: - Public Methods
    
    /// Метод для аутентификации. Принимает email и пароль и в
    /// completionHanler возвращает данные пользователя (email) и ошибку
    public func authorize(
        email: String,
        password: String,
        _ completionHandler: @escaping (Result<String, AuthorizationError>
    ) -> Void) {
        
        // временный delay для проверки индикатора в LoginViewController
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler(.success(email))
        }
    }
}
