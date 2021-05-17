//
//  SearchFriendsViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class SearchFriendsViewController: UIViewController {
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }

}
