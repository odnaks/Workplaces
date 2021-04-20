//
//  UIViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

extension UIViewController {
    func addChild(viewController: UIViewController) {
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
}
