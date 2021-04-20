//
//  TabItem.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import UIKit

enum TabItem: String, CaseIterable {
    case feed
    case profile
    
    var viewController: UIViewController {
        switch self {
        case .feed:
            return FeedViewController()
        case .profile:
            return ProfileViewController()
        }
    }
}
