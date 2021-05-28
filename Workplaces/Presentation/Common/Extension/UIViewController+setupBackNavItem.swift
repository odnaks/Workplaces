//
//  UIViewController+setupBackNavItem.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

extension UIViewController {
    /// Метод для настройки навигейшн бара с кастомной кнопкой назад
    /// и переданным заголовком
    func setupBackNavItem(with title: String) {
        navigationItem.title = title
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: .iconBack,
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
