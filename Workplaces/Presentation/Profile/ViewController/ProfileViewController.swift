//
//  ProfileViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet private weak var dataContainerView: UIView?
    
    // MARK: - Private Properties
    
    private lazy var voidZeroController = VoidZeroViewController()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showVoidZero()
    }
    
    // MARK: - Private Methods
    
    private func showVoidZero() {
        guard let container = dataContainerView else { return }
        
        voidZeroController.delegate = self
        showChild(voidZeroController, to: container)
    }
}

// MARK: - VoidZeroControllerDelegate

extension ProfileViewController: VoidZeroControllerDelegate {
    func createPost() {
        print(#function)
    }
}
