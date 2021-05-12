//
//  FriendViewModel.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import UIKit

public struct FriendViewModel {
    
    // MARK: - Public Properties
    
    let name: String
    let nickname: String?
    let photo: URL?
    
    // MARK: - Initialization
    
    public init(
        name: String,
        nickname: String? = nil,
        photo: URL? = nil
    ) {
        self.name = name
        self.nickname = nickname
        self.photo = photo
    }
}
