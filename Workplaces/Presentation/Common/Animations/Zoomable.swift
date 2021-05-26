//
//  Zoomable.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 23.05.2021.
//

import UIKit

protocol Zoomable {

    /// Функция добавляет на объект анимацию увеличения.
    /// Возвращает объект в изначальное положение
    func zoomIn()
    
    /// Функция добавляет на объект анимацию уменьшения.
    /// Возвращает объект, который был трансформирован
    func zoomOut()
}

extension Zoomable where Self: UIView {
    func zoomIn() {
        CATransaction.begin()
        let zoomInAnimation = CABasicAnimation.zoomIn()
        CATransaction.setCompletionBlock {
            self.transform = .identity
        }
        self.layer.add(zoomInAnimation, forKey: "zoomIn")
        CATransaction.commit()
    }
    
    func zoomOut() {
        CATransaction.begin()
        let zoomInAnimation = CABasicAnimation.zoomOut()
        CATransaction.setCompletionBlock {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        self.layer.add(zoomInAnimation, forKey: "zoomOut")
        CATransaction.commit()
    }
}
