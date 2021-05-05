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
    
    func showChild(
        _ viewController: UIViewController,
        to containerView: UIView
    ) {
        addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            viewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            viewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
        viewController.didMove(toParent: self)
    }
    
    func hideChild(_ viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    func switchChild(
        viewControllerToHide: UIViewController,
        viewControllerToShow: UIViewController,
        containerView: UIView
    ) {
        hideChild(viewControllerToHide)
        showChild(viewControllerToShow, to: containerView)
    }
}
