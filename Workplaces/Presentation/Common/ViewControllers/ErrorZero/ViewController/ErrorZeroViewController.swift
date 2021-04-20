//
//  ErrorZeroViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

protocol ErrorZeroControllerDelegate: class {
    func reload()
}

class ErrorZeroViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: ErrorZeroControllerDelegate?

    // MARK: - LifeCircle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickReload(_ sender: Any) {
        delegate?.reload()
    }
    
}
