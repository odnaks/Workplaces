//
//  Error+UnwrapError.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 09.06.2021.
//

import Foundation

public extension Error {

    /// Метод нужен для того чтобы достать ошибку валидации из Alamofire
    func unwrapAFError() -> Error {
        guard let afError = asAFError else { return self }
        if case .responseValidationFailed(let reason) = afError,
           case .customValidationFailed(let underlyingError) = reason {
            return underlyingError
        }
        return self
    }

}
