//
//  CompletedAuthorizationViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

protocol CompletedAuthorizationViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку "перейти к ленте"
    func completedAuthorizationViewControllerDone()
}

final class CompletedAuthorizationViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: CompletedAuthorizationViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var illustrationImageView: UIImageView!
    
    // MARK: - Life Circle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        illustrationImageView.gravitate()
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapContinue(_ sender: Any) {
        delegate?.completedAuthorizationViewControllerDone()
    }

}
