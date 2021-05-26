//
//  ListPostsHeader.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

final class ListPostsHeader: UITableViewHeaderFooterView {
    
    // MARK: - Constants
    
    static let identifier = "ListPostsHeader"
    
    // MARK: - Public properties
    
    var label: UILabel = {
        let label: UILabel = UILabel()
        label.font = .bodyLarge
        label.textColor = .black
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .lightGrey
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
