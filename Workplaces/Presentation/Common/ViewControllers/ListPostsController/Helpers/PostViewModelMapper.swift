//
//  PostViewModelMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import WorkplacesAPI

extension PostViewModel {
    
    /// Метод для маппинга данных из Post в PostViewModel
    static func map(from data: Post) -> PostViewModel {
        let id = data.id
        let text = data.text
        let address = "Россия, Москва"
        let photo = data.imageUrl
        let rawNickname: String = data.author.nickname ?? ""
        let nickname = "@\(rawNickname)"
        let isLiked = data.likes > 0
        
        return PostViewModel(
            id: id,
            text: text,
            address: address,
            photo: photo,
            authorNickname: nickname,
            isLiked: isLiked
        )
    }
}
