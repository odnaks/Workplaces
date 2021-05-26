//
//  Shakeable.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 23.05.2021.
//

import UIKit

protocol Shakeable {

    /// функция добавляет на объект анимацию тряски влево-вправо
    func shake()
}

extension Shakeable where Self: UIView {
    func shake() {
        let shakeAnimation = CABasicAnimation.shake(for: self.center)
        self.layer.add(shakeAnimation, forKey: "shake")
    }
}
