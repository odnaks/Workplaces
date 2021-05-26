//
//  StartViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

protocol StartViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку "логин"
    func startViewControllerToLogin()
    
    /// метод, вызываемый при нажатии на кнопку "регистрация"
    func startViewControllerToRegistration()
}

final class StartViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: StartViewControllerDelegate?

    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapLogin(_ sender: Any) {
        delegate?.startViewControllerToLogin()
    }
    
    @IBAction private func didTapRegistration(_ sender: Any) {
        delegate?.startViewControllerToRegistration()
    }
    
}
