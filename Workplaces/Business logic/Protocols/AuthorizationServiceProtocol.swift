//
//  AuthorizationServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import WorkplacesAPI

/// Сервис для авторизации
protocol AuthorizationServiceProtocol {
    
    /// Метод для отправки post запроса с email и password (UserCredentials)
    /// для аутентификации. В completionHanler возвращает ответ с сервера
    /// Token и сообщение об ошибке
    func login(
        with userCredentials: UserCredentials,
        completion: @escaping (Result<Token, AuthorizationError>) -> Void
    ) -> Progress
    
    /// Метод для проверки: авторизизован ли пользователь.
    /// Возвращает True, если авторизирован,
    /// Иначе - False
    func checkLogin() -> Bool
    
    /// Метод для отправки post запроса с email и password (UserCredentials)
    /// для регистрации. В completionHanler возвращает ответ с сервера
    /// Token и сообщение об ошибке
    func registration(
        with userCredentials: UserCredentials,
        completion: @escaping (Result<Token, AuthorizationError>) -> Void
    ) -> Progress
    
    /// Метод для отправки post запроса с bearer-кодом в header
    /// для разлогина. В completionHanler возвращает Void и сообщение об ошибке
    func logout(
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress

}
