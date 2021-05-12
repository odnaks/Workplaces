//
//  ZeroViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

enum ZeroControllerType {
    case errorController
    case voidController
}

protocol ZeroViewControllerDelegate: class {
    /// метод, вызываемый при нажатии на кнопку на странице
    func zeroViewController()
}

final class ZeroViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var illustrationView: UIImageView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var subtitleLabel: UILabel?
    @IBOutlet private weak var actionButton: UIButton?
    
    // MARK: - Public Properties
    
    public weak var delegate: ZeroViewControllerDelegate?
    
    // MARK: - Private Properties
    
    private let zeroControllerType: ZeroControllerType
    
    // MARK: - Initialization

    init(
        zeroControllerType: ZeroControllerType = .voidController
    ) {
        self.zeroControllerType = zeroControllerType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickButton(_ sender: Any) {
        delegate?.zeroViewController()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        switch zeroControllerType {
        case .errorController:
            illustrationView?.image = .errorDoodle
            titleLabel?.text = "Упс..."
            subtitleLabel?.text = "Что-то пошло не так"
            actionButton?.titleLabel?.text = "Обновить"
        case .voidController:
            illustrationView?.image = .voidDoodle
            titleLabel?.text = "Пустота"
            subtitleLabel?.text = "Если молчать, люди никогда не узнают о вас"
            actionButton?.titleLabel?.text = "Создать пост"
        }
    }

}
