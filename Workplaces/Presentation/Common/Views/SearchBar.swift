//
//  SearchBar.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 24.05.2021.
//

import UIKit

final class SearchBar: UISearchBar {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        searchBarStyle = .default
        let searchSearchButton = UIImageView(image: .iconSearch)
        searchTextField.leftView = searchSearchButton
        
        setImage(.iconClose, for: .clear, state: .normal)
        
        tintColor = .orange
        barTintColor = UIColor.white
        backgroundColor = UIColor.white
        isTranslucent = true
        
        setBackgroundImage(.searchLine, for: .any, barMetrics: .default)
        searchTextField.backgroundColor = .white
    }
}
