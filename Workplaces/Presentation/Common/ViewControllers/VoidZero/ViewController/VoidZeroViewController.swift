//
//  VoidZeroViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

protocol VoidZeroControllerDelegate: class {
    func createPost()
}

class VoidZeroViewController: UIViewController {

    // MARK: - Public Properties
    
    public weak var delegate: VoidZeroControllerDelegate?

    // MARK: - LifeCircle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction

    @IBAction private func clickCreatePost(_ sender: Any) {
        delegate?.createPost()
    }
}
