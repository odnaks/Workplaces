//
//  FriendsContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class FriendsContainerController: UIViewController {

    // MARK: - Private Properties
    
    private let voidController: ZeroViewController
    private let searchFriendsViewController: SearchFriendsViewController
    private let friendsViewController: FriendsViewController
    
    private var friends: [FriendViewModel]?
    
    // MARK: - Initialization
    
    init(
        friendsFabric: FriendsFabric
    ) {
        self.voidController = friendsFabric.getFriendsVoidController()
        self.searchFriendsViewController = friendsFabric.getSearchFriendsViewController()
        self.friendsViewController = friendsFabric.getFriendsViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации загруженных постов в таблицу
    func configure(with friends: [FriendViewModel]) {
        if !friends.isEmpty {
            self.friends = friends
            showListFriends()
        }
    }
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        showVoidController()
    }
    
    // MARK: - Private Methods
    
    private func showVoidController() {
        voidController.delegate = self
        
        showChild(voidController, to: view)
    }
    
    private func showListFriends() {
        friendsViewController.configure(with: friends)
        
        switchChild(
            viewControllerToHide: voidController,
            viewControllerToShow: friendsViewController,
            containerView: view
        )
    }
    
    private func showSearchFriendsViewController() {
        self.present(searchFriendsViewController, animated: true)
    }

}

// MARK: - ZeroViewControllerDelegate

extension FriendsContainerController: ZeroViewControllerDelegate {
    func zeroViewController() {
        showSearchFriendsViewController()
    }
}
