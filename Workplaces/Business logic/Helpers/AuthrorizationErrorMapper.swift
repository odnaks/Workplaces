//
//  AuthrorizationErrorMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 23.05.2021.
//

import WorkplacesAPI

extension AuthorizationError {
    
    /// Метод для маппинга данных из Error в AuthorizationError
    static func mapToAuthorizationError(from error: Error) -> AuthorizationError {
        if let apiError = error as? APIError {
            switch apiError.code {
            case .invalidCredentials:
                return .invalidCredentials
            case .emailValidationError:
                return emailValidationError
            case .passwordValidationError:
                return .passwordValidationError
            case .duplicateUserError:
                return .duplicateUserError
            default:
                return .defaultError
            }
        } else {
            return .defaultError
        }
    }
    
}
