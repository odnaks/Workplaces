//
//  AuthorizationServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import Foundation

protocol AuthorizationServiceProtocol {
    func authorize(email: String,
                   password: String,
                   _ completionHandler: @escaping (Result<String, AuthorizationError>) -> Void)
}
