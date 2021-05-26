//
//  UIViewController+setupKeyboardObservers.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

extension UIViewController {
    /// Метод для добавления обсерверов для клавиатуры,
    /// которые следят за ее состояниям и поднимают
    /// сейф эрею, когда клава появляется.
    func setupKeyboardObservers() {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                                    as? NSValue)?.cgRectValue else { return }
        additionalSafeAreaInsets.bottom = keyboardSize.height
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        additionalSafeAreaInsets.bottom = 0
    }
}
