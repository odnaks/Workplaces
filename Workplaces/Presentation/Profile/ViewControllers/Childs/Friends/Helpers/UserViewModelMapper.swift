//
//  UserViewModelMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import WorkplacesAPI

extension FriendViewModel {
    
    /// Метод для маппинга данных из UserProfile в FriendViewModel
    public static func map(from data: UserProfile) -> FriendViewModel {
        let name = "\(data.firstName) \(data.lastName)"
        let nickname = data.nickname
        let photo = data.avatarUrl
        
        return FriendViewModel(
            name: name,
            nickname: nickname,
            photo: photo
        )
    }
    
}
