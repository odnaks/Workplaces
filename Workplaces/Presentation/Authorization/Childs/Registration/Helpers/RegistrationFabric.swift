//
//  RegistrationFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import Foundation

final class RegistrationFabric {
    
    // MARK: - Public Methods
    
    /// Метод для получения RegistrationFirstViewController
    public func getRegistrationFirstViewController() -> RegistrationFirstViewController {
        return RegistrationFirstViewController()
    }
    
    /// Метод для получения RegistrationSecondViewController
    public func getRegistrationSecondViewController() -> RegistrationSecondViewController {
        return RegistrationSecondViewController()
    }
    
}
