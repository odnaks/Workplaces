//
//  StartViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

protocol StartViewControllerDelegate: class {
    
    /// метод, вызываемый при нажатии на кнопку "логин"
    func startViewControllerToLogin()
    
    /// метод, вызываемый при нажатии на кнопку "регистрация"
    func startViewControllerToRegistration()
}

final class StartViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: StartViewControllerDelegate?

    // MARK: - Life Circle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickLogin(_ sender: Any) {
        delegate?.startViewControllerToLogin()
    }
    
    @IBAction private func clickRegistration(_ sender: Any) {
        delegate?.startViewControllerToRegistration()
    }
    
}
