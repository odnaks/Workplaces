//
//  AuthorizationFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import UIKit

final class AuthorizationFabric {
    
    // MARK: - Private Properties
    
    private let registrationFabric: RegistrationFabric
    
    // MARK: - Initialization
    
    init(
        registrationFabric: RegistrationFabric
    ) {
        self.registrationFabric = registrationFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения StartViewController
    func getStartViewController() -> StartViewController {
        return StartViewController()
    }
    
    /// Метод для получения CompletedAuthorizationViewController
    func getLoginViewController() -> LoginViewController {
        return LoginViewController()
    }
    
    /// Метод для получения RegistrationContainerController
    func getRegistrationContainerController() -> RegistrationContainerController {
        return RegistrationContainerController(
            registrationFabric: registrationFabric
        )
    }
    
    /// Метод для получения CompletedAuthorizationViewController
    func getCompletedLoginViewController() -> CompletedAuthorizationViewController {
        return CompletedAuthorizationViewController()
    }
    
    /// Метод для получения UINavigationController
    func getAuthorizationNavigationController() -> UINavigationController {
        return UINavigationController()
    }
    
    /// Метод для получения PasswordViewController
    func getPasswordViewController() -> PasswordViewController {
        return PasswordViewController()
    }
    
}
