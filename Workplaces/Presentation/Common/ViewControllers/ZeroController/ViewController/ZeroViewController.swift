//
//  ZeroViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import UIKit

enum ZeroControllerType {
    case error
    case void
}

protocol ZeroViewControllerDelegate: AnyObject {
    /// метод, вызываемый при нажатии на кнопку на странице
    func zeroViewController()
}

final class ZeroViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: ZeroViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var illustrationView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subtitleLabel: UILabel!
    @IBOutlet private var actionButton: UIButton!
    
    // MARK: - Private Properties
    
    private let zeroControllerType: ZeroControllerType
    private let titleText: String
    private let subtitleText: String
    private let buttonText: String
    
    // MARK: - Initialization

    init(
        zeroControllerType: ZeroControllerType = .void,
        titleText: String = "Упс...",
        subtitleText: String = "Что-то пошло не так",
        buttonText: String = "Обновить"
    ) {
        self.zeroControllerType = zeroControllerType
        self.titleText = titleText
        self.subtitleText = subtitleText
        self.buttonText = buttonText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .zeroScreen
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        setupUI()
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapButton(_ sender: Any) {
        delegate?.zeroViewController()
    }
    
    // MARK: - Private methods
    
    private func setupUI() {
        illustrationView.image = zeroControllerType == .error ? .errorDoodle : .voidDoodle
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
        actionButton.setTitle(buttonText, for: .normal)
        setupStackSpacings()
    }
    
    private func setupStackSpacings() {
        stackView.setCustomSpacing(8.0, after: titleLabel)
        stackView.setCustomSpacing(24.0, after: subtitleLabel)
    }

}
