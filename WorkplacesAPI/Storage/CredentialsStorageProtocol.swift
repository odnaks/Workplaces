//
//  CredentialsStorageProtocol.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

public protocol CredentialsStorageProtocol: AnyObject {
    var token: Token? { get set }
}
