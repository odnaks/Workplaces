//
//  NewPostViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

protocol NewPostViewControllerDelegate: class {
    /// метод, вызываемый при нажатии на кнопку запостить
    func newPostViewControllerPost()
}

final class NewPostViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: NewPostViewControllerDelegate?
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
