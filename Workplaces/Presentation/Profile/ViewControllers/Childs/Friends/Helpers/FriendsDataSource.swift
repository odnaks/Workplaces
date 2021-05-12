//
//  FriendsDataSource.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import UIKit

final class FriendsDataSource: NSObject {
    public var viewModel: [FriendViewModel]?
}

// MARK: - UITableViewDataSource

extension FriendsDataSource: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FriendCell.identifier,
                for: indexPath) as? FriendCell,
              let friend = viewModel?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.configure(friend)
        
        return cell
        
    }
    
}
