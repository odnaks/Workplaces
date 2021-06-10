//
//  TokenStorage.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Foundation

public final class TokenStorage: TokenStorageProtocol {
    
    // MARK: - Private properties
    
    private let serialQueue: DispatchQueue
    
    // MARK: - Initialization
    
    public init() {
        self.serialQueue = DispatchQueue(label: "serialTokenRefreshQueue", qos: .utility)
    }
    
    // MARK: - Public properties
    
    public var accessToken: String?
}
