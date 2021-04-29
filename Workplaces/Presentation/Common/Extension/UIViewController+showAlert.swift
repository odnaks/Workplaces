//
//  UIViewController+showAlert.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Alamofire
import UIKit
import WorkplacesAPI

extension UIViewController {
    
    /// Метод для представления UIAlertController
    /// Принимает ошибку, проверяет ее тип и в зависимости
    /// от него добавляет сообщение на алерт
    func showAlert(with error: Error) {
        var message: String?
        
        let error = error.unwrapAFError()
        switch error {
        case is APIError:
            message = (error as? APIError)?.message
        default:
            message = error.localizedDescription
        }
        let alertController = UIAlertController(
            title: "Что-то пошло не так",
            message: message, preferredStyle: .alert
        )
        let closeAction = UIAlertAction(title: "Ок", style: .cancel)
        alertController.addAction(closeAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

public extension Error {

    /// Метод нужен для того чтобы достать ошибку валидации из Alamofire
    func unwrapAFError() -> Error {
        guard let afError = asAFError else { return self }
        if case .responseValidationFailed(let reason) = afError,
           case .customValidationFailed(let underlyingError) = reason {
            return underlyingError
        }
        return self
    }

}
