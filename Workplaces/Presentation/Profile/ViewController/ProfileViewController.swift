//
//  ProfileViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet private weak var dataContainerView: UIView?
    
    // MARK: - Private Properties
    
    private let voidZeroController: ZeroViewController?
    
    // MARK: - Initialization

    init(
        zeroControllerType: ZeroControllerType = .voidController,
        zeroControllerFactory: ZeroControllerFactoryProtocol = ZeroControllerFactory()
    ) {
        self.voidZeroController = zeroControllerFactory.getZeroController(by: zeroControllerType)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showVoidZero()
    }
    
    // MARK: - Private Methods
    
    private func showVoidZero() {
        guard let controller = voidZeroController,
              let container = dataContainerView else { return }
        
        controller.delegate = self
        showChild(controller, to: container)
    }
}

// MARK: - ZeroViewControllerDelegate

extension ProfileViewController: ZeroViewControllerDelegate {
    func handleClickButton() {
        print(#function)
    }
}
