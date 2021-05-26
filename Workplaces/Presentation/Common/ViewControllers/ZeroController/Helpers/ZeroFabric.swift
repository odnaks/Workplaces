//
//  ZeroFabric.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import Foundation

final class ZeroFabric {
    
    // MARK: - Public Methods
    
    /// Метод для получения FeedVoidController
    func getFeedVoidController() -> ZeroViewController {
        return ZeroViewController(
            zeroControllerType: .void,
            titleText: "Пустота",
            subtitleText: "Вам нужны друзья, чтобы лента стала живой",
            buttonText: "Найти друзей"
        )
    }
    
    /// Метод для получения FeedErrorController
    func getFeedErrorController() -> ZeroViewController {
        return ZeroViewController(
            zeroControllerType: .error,
            titleText: "Упс...",
            subtitleText: "Что-то пошло не так",
            buttonText: "Обновить"
        )
    }
    
    /// Метод для получения MyPostsVoidController
    func getMyPostsVoidController() -> ZeroViewController {
        return ZeroViewController(
            zeroControllerType: .void,
            titleText: "Пустота",
            subtitleText: "Если молчать, люди никогда не узнают о вас",
            buttonText: "Создать пост"
        )
    }
    
    /// Метод для получения LikedPostsVoidController
    func getLikedPostsVoidController() -> ZeroViewController {
        return ZeroViewController(
            zeroControllerType: .void,
            titleText: "Пустота",
            subtitleText: "Вы ещё не поставили ни одного лайка, но можете из ленты",
            buttonText: "Перейти к ленте"
        )
    }
    
    /// Метод для получения FriendsVoidController
    func getFriendsVoidController() -> ZeroViewController {
        return ZeroViewController(
            zeroControllerType: .void,
            titleText: "Пустота",
            subtitleText: "Вы пока одиноки в сервисе, но это можно исправить",
            buttonText: "Найти друзей"
        )
    }
}
