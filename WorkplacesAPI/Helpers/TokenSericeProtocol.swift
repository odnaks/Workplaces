//
//  TokenSericeProtocol.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 01.06.2021.
//

import Foundation

/// Сервис для работы с токеном
public protocol TokenServiceProtocol {
    
    /// Метод для обновления токена.
    /// В completionHanler возвращает массив `Token` и сообщение об ошибке
    func refresh(
        completion: @escaping (Result<Token, Error>) -> Void
    ) -> Progress
}
