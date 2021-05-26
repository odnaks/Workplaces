//
//  FriendsViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

final class FriendsViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private var dataSource: FriendsDataSource = FriendsDataSource()
    private let profileService: ProfileServiceProtocol
    private var friends: [FriendViewModel]?
    
    /// Метод для конфигурации постов с переданными данными модели
    func configure(with model: [FriendViewModel]?) {
        self.friends = model
        setupTableViewModel()
    }
    
    // MARK: - Initialization
    
    init(
        profileService: ProfileServiceProtocol = ServiceLayer.shared.profileService
    ) {
        self.profileService = profileService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setupTableViewModel() {
        dataSource.viewModel = friends
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = dataSource
        tableView.register(
            UINib(nibName: "\(FriendCell.self)", bundle: nil),
            forCellReuseIdentifier: FriendCell.identifier
        )
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
}
