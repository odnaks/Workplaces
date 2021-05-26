//
//  CABasicAnimation+animations.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 23.05.2021.
//

import UIKit

extension CABasicAnimation {
    
    /// Функция по получению анимации тряски.
    /// Принимает x и y - центральные координаты объекта для перемещения.
    static func shake(for point: CGPoint) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(
            cgPoint: CGPoint(
                x: point.x - 10,
                y: point.y
            )
        )
        animation.toValue = NSValue(
            cgPoint: CGPoint(
                x: point.x + 10,
                y: point.y
            )
        )
        return animation
    }
    
    /// Функция по получению анимации увеличения.
    static func zoomIn() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.2
        animation.fromValue = 0.95
        animation.toValue = 1
        return animation
    }
    
    /// Функция по получению анимации уменьшения.
    static func zoomOut() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.2
        animation.fromValue = 1.0
        animation.toValue = 0.95
        return animation
    }
    
    // Функция по получению анимации вверх-вниз.
    static func gravitation(for y: CGFloat) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.duration = 1
        animation.autoreverses = true
        animation.fromValue = y
        animation.toValue = y - 15
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.repeatCount = .infinity
        return animation
    }

}
