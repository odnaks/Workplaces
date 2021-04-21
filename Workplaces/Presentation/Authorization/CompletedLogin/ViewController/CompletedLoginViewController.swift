//
//  CompletedLoginViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

final class CompletedLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IBAction
    
    @IBAction private func clickContinue(_ sender: Any) {
        view.window?.rootViewController = MainTabBarController()
        view.window?.makeKeyAndVisible()
    }

}
