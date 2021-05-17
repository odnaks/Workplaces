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
    
    private var titleText: String?
    private var subtitleText: String?
    private var buttonText: String?
    private var illustrationImage: UIImage?
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    // MARK: - Public Methods
    
    /// метод для конфигурации зеро скрин контроллера.
    /// дает возможность изменить заголовок, подзаголовок и подпись кнопки
    public func configure(
        title: String,
        subtitle: String? = nil,
        actionButtonTitle: String,
        image: UIImage? = nil
    ) {
        titleText = title
        subtitleText = subtitle
        buttonText = actionButtonTitle
        illustrationImage = image
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickButton(_ sender: Any) {
        delegate?.zeroViewController()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        switch zeroControllerType {
        case .errorController:
            illustrationView?.image = illustrationImage ?? .errorDoodle
            titleLabel?.text = titleText ?? "Упс..."
            subtitleLabel?.text = subtitleText ?? "Что-то пошло не так"
            actionButton?.setTitle(buttonText ?? "Обновить", for: .normal)
        case .voidController:
            illustrationView?.image = illustrationImage ?? .voidDoodle
            titleLabel?.text = titleText ?? "Пустота"
            subtitleLabel?.text = subtitleText ?? "Здесь ничего нет"
            actionButton?.setTitle(buttonText ?? "Создать", for: .normal)
        }
    }

}
