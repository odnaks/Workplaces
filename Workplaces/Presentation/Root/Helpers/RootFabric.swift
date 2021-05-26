//
//  RootFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 15.05.2021.
//

import Foundation

final class RootFabric {
    
    // MARK: - Private Properties
    
    private let authorizationFabric: AuthorizationFabric
    private let mainFabric: MainFabric
    
    // MARK: - Initialization
    
    init(
        authorizationFabric: AuthorizationFabric,
        mainFabric: MainFabric
    ) {
        self.authorizationFabric = authorizationFabric
        self.mainFabric = mainFabric
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения AuthorizationCoordinatingController
    func getAuthorizationCoordinatingController() -> AuthorizationCoordinatingController {
        return AuthorizationCoordinatingController(
            authorizationFabric: authorizationFabric
        )
    }
    
    /// Метод для получения MainCoordinatingController
    func getMainCoordinatingController() -> MainCoordinatingController {
        return MainCoordinatingController(
            mainFabric: mainFabric
        )
    }
}
