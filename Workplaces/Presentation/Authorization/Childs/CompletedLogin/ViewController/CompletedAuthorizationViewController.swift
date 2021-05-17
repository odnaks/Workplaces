//
//  CompletedAuthorizationViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

protocol CompletedAuthorizationViewControllerDelegate: class {
    
    /// метод, вызываемый при нажатии на кнопку "перейти к ленте"
    func completedAuthorizationViewControllerDone()
}

final class CompletedAuthorizationViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: CompletedAuthorizationViewControllerDelegate?
    
    // MARK: - Life Circle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickContinue(_ sender: Any) {
        delegate?.completedAuthorizationViewControllerDone()
    }

}
