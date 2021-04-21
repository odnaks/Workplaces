//
//  ZeroViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

protocol ZeroViewControllerDelegate: class {
    func handleClickButton()
}

final class ZeroViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: ZeroViewControllerDelegate?

    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickButton(_ sender: Any) {
        delegate?.handleClickButton()
    }

}
