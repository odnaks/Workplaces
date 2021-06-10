//
//  AuthorizationError.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 23.05.2021.
//

import Foundation

/// Enum ошибок которые могут возникнуть при авторизации пользователя
public enum AuthorizationError: Error {
    case invalidCredentials
    case emailValidationError
    case passwordValidationError
    case duplicateUserError
    case defaultError
}
