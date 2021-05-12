//
//  PostViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import Foundation

public struct PostViewModel {
    
    // MARK: - Public Properties
    
    let text: String?
    let address: String?
    let photo: URL?
    let authorNickname: String?
    
    // MARK: - Initialization
    
    public init(
        text: String?,
        address: String? = nil,
        photo: URL? = nil,
        authorNickname: String? = nil
    ) {
        self.text = text
        self.address = address
        self.photo = photo
        self.authorNickname = authorNickname
    }
}
