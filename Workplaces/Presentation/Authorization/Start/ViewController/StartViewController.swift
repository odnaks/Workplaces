//
//  StartViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

final class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickLogin(_ sender: Any) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
