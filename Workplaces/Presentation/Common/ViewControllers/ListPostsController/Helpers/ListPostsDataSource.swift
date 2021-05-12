//
//  ListPostsDataSource.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import UIKit

final class ListPostsDataSource: NSObject {
    public var viewModel: [PostViewModel]?
}

// MARK: - UITableViewDataSource

extension ListPostsDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: PostCell.identifier,
                for: indexPath) as? PostCell,
              let post = viewModel?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.configure(post)
        
        return cell
        
    }
    
}
