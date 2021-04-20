//
//  UIViewController+showAlert.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

extension UIViewController {
    
    /// Метод для представления UIAlertController
    /// Принимает сервисную ошибку
    func showAlert(with serviceError: ServiceError) {
        let alertController = UIAlertController(title: "Что-то пошло не так",
                                                message: serviceError.description, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Ок", style: .cancel)
        alertController.addAction(closeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
