//
//  ListPostsViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

protocol ListPostsControllerDelegate: class {
    func getPosts() -> [PostViewModel]?
}

final class ListPostsViewController: UIViewController {
    
    // MARK: - Public Properties
    
    public weak var delegate: ListPostsControllerDelegate?
    
    // MARK: - Private Properties
    
    @IBOutlet private weak var tableView: UITableView?
    private var posts: [PostViewModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        updateTable()
    }
    
    private func setupTableView() {
        tableView?.separatorStyle = .none
        tableView?.showsVerticalScrollIndicator = false
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.register(
            UINib(nibName: "\(PostCell.self)", bundle: nil),
            forCellReuseIdentifier: PostCell.identifier)
    }
    
    private func updateTable() {
        posts = delegate?.getPosts()
        tableView?.reloadData()
    }

}

extension ListPostsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PostCell.identifier,
            for: indexPath
        ) as? PostCell
        else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
    
}
