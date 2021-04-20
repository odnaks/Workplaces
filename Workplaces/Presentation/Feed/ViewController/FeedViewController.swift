//
//  FeedViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

class FeedViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private lazy var errorZeroController = ErrorZeroViewController()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        showErrorZero()
    }
    
    // MARK: - Private Methods
    
    private func showErrorZero() {
        errorZeroController.delegate = self
        
        showChild(errorZeroController, to: view)
    }
}

// MARK: - ErrorZeroControllerDelegate

extension FeedViewController: ErrorZeroControllerDelegate {
    func reload() {
        print(#function)
    }
}
