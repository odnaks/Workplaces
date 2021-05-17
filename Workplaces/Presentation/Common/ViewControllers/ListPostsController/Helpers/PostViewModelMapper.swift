//
//  PostViewModelMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import WorkplacesAPI

extension PostViewModel {
    
    /// Метод для маппинга данных из Post в PostViewModel
    public static func map(from data: Post) -> PostViewModel {
        let text = data.text
        let address = "\(String(describing: data.lon)) \(String(describing: data.lat))"
        let photo = data.imageUrl
        let authorNickname = data.author.nickname
        
        return PostViewModel(
            text: text,
            address: address,
            photo: photo,
            authorNickname: authorNickname
        )
    }
    
}
