//
//  TokenStorageProtocol.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

public protocol TokenStorageProtocol: AnyObject {
    var accessToken: String? { get set }
}
