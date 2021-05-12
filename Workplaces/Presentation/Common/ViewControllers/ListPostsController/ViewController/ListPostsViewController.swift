//
//  ListPostsViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

final class ListPostsViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var tableView: UITableView?
    
    // MARK: - Private Properties
    
    private var dataSource: ListPostsDataSource = ListPostsDataSource()
    private var posts: [PostViewModel]?
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации постов с переданными данными модели
    public func configure(with model: [PostViewModel]?) {
        self.posts = model
        setupTableViewModel()
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    // MARK: - Private Methods
    
    private func setupTableViewModel() {
        dataSource.viewModel = posts
        tableView?.reloadData()
    }
    
    private func setupTableView() {
        tableView?.separatorStyle = .none
        tableView?.showsVerticalScrollIndicator = false
        tableView?.dataSource = dataSource
        tableView?.register(
            UINib(nibName: "\(PostCell.self)", bundle: nil),
            forCellReuseIdentifier: PostCell.identifier
        )
    }
    
}
