//
//  APIError+testError.swift
//  WorkplacesTests
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import WorkplacesAPI

extension APIError {
    public static let testError = APIError(code: "TEST_ERROR", message: "Empty message")
}
