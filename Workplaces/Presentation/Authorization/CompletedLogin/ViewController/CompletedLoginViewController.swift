//
//  CompletedLoginViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

final class CompletedLoginViewController: UIViewController {
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickContinue(_ sender: Any) {
        routeToMain()
    }
    
    // MARK: - Private Methods
    
    private func routeToMain() {
        view.window?.rootViewController = MainTabBarController()
        view.window?.makeKeyAndVisible()
    }

}
