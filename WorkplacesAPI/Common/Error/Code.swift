//
//  Code.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 25.05.2021.
//

import Foundation

public enum Code: String, Codable {
    case invalidCredentials = "INVALID_CREDENTIALS"
    case invalidToken = "INVALID_TOKEN"
    case emailValidationError = "EMAIL_VALIDATION_ERROR"
    case passwordValidationError = "PASSWORD_VALIDATION_ERROR"
    case duplicateUserError = "DUPLICATE_USER_ERROR"
    case serializationError = "SERIALIZATION_ERROR"
    case fileNotFoundError = "FILE_NOT_FOUND_ERROR"
    case tooBigFileError = "TOO_BIG_FILE_ERROR"
    case badFileExtensionError = "BAD_FILE_EXTENSION_ERROR"
    case genericError = "GENERIC_ERROR"
    case unknownError = "UNKNOWN_ERROR"
}
