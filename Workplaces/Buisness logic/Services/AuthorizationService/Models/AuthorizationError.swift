//
//  AuthorizationError.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import Foundation

enum AuthorizationError: ServiceError {
    case defaultError
    case emailError
    case passwordError
    
    var description: String {
        switch self {
        case .emailError:
            return "Некорректный e-mail"
        case .passwordError:
            return "Некорректный пароль"
        default:
            return localizedDescription
        }
    }
}
