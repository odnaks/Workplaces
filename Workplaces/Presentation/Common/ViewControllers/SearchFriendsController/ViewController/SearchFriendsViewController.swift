//
//  SearchFriendsViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

enum SearchFriendsViewControllerState {
    case void
    case listFriends
}

protocol SearchFriendsViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый, когда пользователь пишет текст в поисковой строке
    func searchFriendsViewController(_ searchText: String)
    
    /// метод, вызываемый, когда пользователь нажал кнопку добавления друга
    func searchFriendsViewControllerAddFriend(_ friendID: String)
}

final class SearchFriendsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    weak var delegate: SearchFriendsViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var voidLabel: UILabel!
    
    // MARK: - Private properties
    
    private var dataSource: SearchFriendsDataSource = SearchFriendsDataSource()
    private var state: SearchFriendsViewControllerState = .void {
        didSet {
            updateTableState()
        }
    }
    
    // MARK: - Public Methods
    
    /// Метод, вызываемый после загрузки списка юзеров при поиске.
    /// `Users` - передаваемый параметр, создержащий юзеров для отображения
    func updateUsersList(_ users: [FriendViewModel]) {
        dataSource.viewModel = users
        tableView.reloadData()
    }
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layoutMargins = .standart
        setupTableView()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
        setupBackNavItem(with: "Поиск друзей")
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        dataSource.viewController = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = dataSource
        tableView.register(
            UINib(nibName: "\(FriendSearchCell.self)", bundle: nil),
            forCellReuseIdentifier: FriendSearchCell.identifier
        )
    }
    
    private func updateTableState() {
        voidLabel.isHidden = state == .listFriends
        tableView.isHidden = state == .void
    }

}

// MARK: - UISearchBarDelegate

extension SearchFriendsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            state = .void
            return
        }
        state = .listFriends
        delegate?.searchFriendsViewController(searchText)
    }
}

// MARK: - FriendSearchCellDelegate

extension SearchFriendsViewController: FriendSearchCellDelegate {
    func friendSearchCellAddFriend(_ friendID: String) {
        delegate?.searchFriendsViewControllerAddFriend(friendID)
    }
}
