//
//  HomeVoidContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class HomeVoidContainerController: UIViewController {
    
    // MARK: - Private Properties
    
    private let homeVoidNavigationController: UINavigationController
    private let voidController: ZeroViewController
    private let searchViewController: SearchFriendsViewController
    
    // MARK: - Initialization
    
    init(
        homeVoidContainerFabric: HomeVoidFabric
    ) {
        self.voidController = homeVoidContainerFabric.getFeedVoidController()
        self.searchViewController = homeVoidContainerFabric.getSearchFriendsViewController()
        self.homeVoidNavigationController = homeVoidContainerFabric.getNavigationController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        showVoidController()
    }
    
    // MARK: - Private Methods
    
    private func showVoidController() {
        voidController.delegate = self
        homeVoidNavigationController.navigationBar.isHidden = true
        homeVoidNavigationController.pushViewController(voidController, animated: false)
        
        showChild(homeVoidNavigationController, to: view)
    }
    
    private func showSearchFriendsController() {
        homeVoidNavigationController.pushViewController(searchViewController, animated: true)
    }

}

// MARK: - ZeroViewControllerDelegate

extension HomeVoidContainerController: ZeroViewControllerDelegate {
    func zeroViewController() {
        showSearchFriendsController()
    }
}
