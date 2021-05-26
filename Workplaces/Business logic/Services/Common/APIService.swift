//
//  APIService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 27.04.2021.
//

import Apexy

/// Базовый сервис с API клиентом.
open class APIService {
    
    // MARK: - Public Properties
    
    let apiClient: Client
    
    // MARK: - Initialization
    
    init(apiClient: Client) {
        self.apiClient = apiClient
    }
}
