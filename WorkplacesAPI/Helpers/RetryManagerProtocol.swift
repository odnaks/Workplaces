//
//  RetryManagerProtocol.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 01.06.2021.
//

import Alamofire

/// Менеджер, который занимается логикой ретраев
public protocol RetryManagerProtocol {
    
    /// метод, который делает ретрай реквеста `request`
    /// принимает `completion` – комлишен реквеста, вызываемый при завершении ретрая
    /// и `error` – ошибка, с которой вернулся реквест
    func retry(request: Request, with completion: @escaping (RetryResult) -> Void, and error: Error)
}
