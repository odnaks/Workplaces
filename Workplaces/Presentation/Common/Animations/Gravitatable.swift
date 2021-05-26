//
//  Gravitatable.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 25.05.2021.
//

import UIKit

protocol Gravitatable {

    /// функция добавляет на объект анимацию вверх-вниз
    func gravitate()
}

extension Gravitatable where Self: UIView {
    func gravitate() {
        let shakeAnimation = CABasicAnimation.gravitation(for: self.center.y)
        self.layer.add(shakeAnimation, forKey: "gravitation")
    }
}

extension UIImageView: Gravitatable {}
