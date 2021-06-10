//
//  SerurityServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 09.06.2021.
//

import Foundation

/// Сервис для безопасной работы с хранилищем
public protocol SecurityServiceProtocol {
    
    /// Метод для сохранения состояния о методе защиты пользователя
    /// Принимает `state` – состояние
    func saveProtectionState(_ state: ProtectionState)
    
    /// Метод для получения состояния о методе защиты пользователя
    func getProtectionState() -> ProtectionState
    
    /// Метод для получения `refresh token`
    func getRefreshToken(with password: String) -> String
    
    /// Метод для сохранения токена.
    /// Принимает `token` – пароль
    /// и `password` – пароль
    func saveRefreshToken(_ token: String, with password: String)
}
