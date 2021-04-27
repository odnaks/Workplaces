//
//  CredentialsStorageProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public protocol CredentialsStorageProtocol {
    func save(_ token: Token)
    func getToken() -> Token?
}
