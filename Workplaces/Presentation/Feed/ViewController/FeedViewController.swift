//
//  FeedViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

final class FeedViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let errorZeroController: ZeroViewController?
    
    // MARK: - Initialization

    init(
        zeroControllerType: ZeroControllerType = .errorController,
        zeroControllerFactory: ZeroControllerFactoryProtocol = ZeroControllerFactory()
    ) {
        self.errorZeroController = zeroControllerFactory.getZeroController(by: zeroControllerType)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemPink
        
        showErrorZero()
    }
    
    // MARK: - Private Methods
    
    private func showErrorZero() {
        guard let controller = errorZeroController else { return }
        
        controller.delegate = self
        showChild(controller, to: view)
    }
}

// MARK: - ZeroViewControllerDelegate

extension FeedViewController: ZeroViewControllerDelegate {
    func handleClickButton() {
        print(#function)
    }
}
