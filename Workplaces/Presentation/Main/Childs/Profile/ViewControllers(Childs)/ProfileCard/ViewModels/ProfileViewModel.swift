//
//  ProfileViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

struct ProfileViewModel {
    
    // MARK: - Public Properties
    
    let name: String
    let years: Int?
    let photo: URL?
    
    // MARK: - Initialization
    
    init(
        name: String,
        years: Int? = nil,
        photo: URL? = nil
    ) {
        self.name = name
        self.years = years
        self.photo = photo
    }
}
