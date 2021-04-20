//
//  UIView+cornerRadius.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
