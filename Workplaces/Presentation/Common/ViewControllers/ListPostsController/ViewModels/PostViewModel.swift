//
//  PostViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

struct PostViewModel {
    
    // MARK: - Public Properties
    
    let id: String
    let text: String?
    let address: String?
    let photo: URL?
    let authorNickname: String?
    let isLiked: Bool
    
    // MARK: - Initialization
    
    init(
        id: String,
        text: String?,
        address: String? = nil,
        photo: URL? = nil,
        authorNickname: String? = nil,
        isLiked: Bool = false
    ) {
        self.id = id
        self.text = text
        self.address = address
        self.photo = photo
        self.authorNickname = authorNickname
        self.isLiked = isLiked
    }
}
