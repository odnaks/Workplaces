//
//  SearchFriendsDataSource.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

final class SearchFriendsDataSource: NSObject {
    weak var viewController: SearchFriendsViewController?
    var viewModel: [FriendViewModel]?
}

// MARK: - UITableViewDataSource

extension SearchFriendsDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FriendSearchCell.identifier,
                for: indexPath) as? FriendSearchCell,
              let post = viewModel?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.delegate = viewController
        cell.configure(post)
        
        return cell
    }
    
}
