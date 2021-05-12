//
//  EditingProfileViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import UIKit

final class EditingProfileViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func routeToBack() {
        self.dismiss(animated: true)
    }
    
    // MARK: - IBAction
    
    @IBAction private func backClick(_ sender: Any) {
        routeToBack()
    }
}
