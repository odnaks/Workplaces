//
//  FeedViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

final class FeedViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let feedService: FeedServiceProtocol
    private let errorZeroController: ZeroViewController?
    
    // MARK: - Initialization

    init(
        feedService: FeedServiceProtocol = ServiceLayer.shared.feedService
    ) {
        self.feedService = feedService
        
        self.errorZeroController = ZeroViewController(zeroControllerType: .errorController)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorZeroController?.delegate = self

        showErrorZero()
    }
    
    // MARK: - Private Methods
    
    private func showErrorZero() {
        guard let controller = errorZeroController else { return }
        
        showChild(controller, to: view)
    }
}

// MARK: - ZeroViewControllerDelegate

extension FeedViewController: ZeroViewControllerDelegate {
    func zeroViewController() {
        print(#function)
    }
}
