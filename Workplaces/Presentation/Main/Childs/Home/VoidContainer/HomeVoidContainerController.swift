//
//  HomeVoidContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

protocol HomeVoidContainerControllerDelegate: AnyObject {
    
    /// метод, вызываемый, когда пользователь пишет текст в поисковой строке
    func homeVoidContainerController(_ searchText: String)
    
    /// метод, вызываемый, когда пользователь нажал кнопку добавления друга
    func homeVoidContainerControllerAddFriend(_ friendID: String)
}

final class HomeVoidContainerController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: HomeVoidContainerControllerDelegate?
    
    // MARK: - Private Properties
    
    private let homeVoidNavigationController: UINavigationController
    private let voidController: ZeroViewController
    private let searchViewController: SearchFriendsViewController
    
    // MARK: - Public Methods
    
    /// Метод, вызываемый после загрузки списка юзеров при поиске.
    /// `Users` - передаваемый параметр, создержащий юзеров для отображения
    func updateUsersList(_ users: [FriendViewModel]) {
        searchViewController.updateUsersList(users)
    }
    
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
        searchViewController.delegate = self
        homeVoidNavigationController.pushViewController(searchViewController, animated: true)
    }

}

// MARK: - ZeroViewControllerDelegate

extension HomeVoidContainerController: ZeroViewControllerDelegate {
    func zeroViewController() {
        showSearchFriendsController()
    }
}

// MARK: - SearchFriendsViewControllerDelegate

extension HomeVoidContainerController: SearchFriendsViewControllerDelegate {
    func searchFriendsViewControllerAddFriend(_ friendID: String) {
        delegate?.homeVoidContainerControllerAddFriend(friendID)
    }
    
    func searchFriendsViewController(_ searchText: String) {
        delegate?.homeVoidContainerController(searchText)
    }
}
