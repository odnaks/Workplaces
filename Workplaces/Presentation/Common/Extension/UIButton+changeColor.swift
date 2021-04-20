//
//  UIButton+changeColor.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

extension UIButton {
    func changeColor(_ color: UIColor) {
        if let tempImage = imageView?.image?.withRenderingMode(.alwaysTemplate) {
            setImage(tempImage, for: .normal)
            tintColor = color
        }
    }
}
