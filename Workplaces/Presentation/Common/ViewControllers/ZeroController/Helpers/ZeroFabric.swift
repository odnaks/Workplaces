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
    public func getFeedVoidController() -> ZeroViewController {
        let zeroVC = ZeroViewController(zeroControllerType: .voidController)
        zeroVC.configure(
            title: "Пустота",
            subtitle: "Вам нужны друзья, чтобы лента стала живой",
            actionButtonTitle: "Найти друзей"
        )
        return zeroVC
    }
    
    /// Метод для получения FeedErrorController
    public func getFeedErrorController() -> ZeroViewController {
        let zeroVC = ZeroViewController(zeroControllerType: .errorController)
        zeroVC.configure(
            title: "Упс...",
            subtitle: "Что-то пошло не так",
            actionButtonTitle: "Обновить"
        )
        return zeroVC
    }
    
    /// Метод для получения MyPostsVoidController
    public func getMyPostsVoidController() -> ZeroViewController {
        let zeroVC = ZeroViewController(zeroControllerType: .voidController)
        zeroVC.configure(
            title: "Пустота",
            subtitle: "Если молчать, люди никогда не узнают о вас",
            actionButtonTitle: "Создать пост"
        )
        return zeroVC
    }
    
    /// Метод для получения LikedPostsVoidController
    public func getLikedPostsVoidController() -> ZeroViewController {
        let zeroVC = ZeroViewController(zeroControllerType: .voidController)
        zeroVC.configure(
            title: "Пустота",
            subtitle: "Вы ещё не поставили ни одного лайка, но можете из ленты",
            actionButtonTitle: "Перейти к ленте"
        )
        return zeroVC
    }
    
    /// Метод для получения FriendsVoidController
    public func getFriendsVoidController() -> ZeroViewController {
        let zeroVC = ZeroViewController(zeroControllerType: .voidController)
        zeroVC.configure(
            title: "Пустота",
            subtitle: "Вы пока одиноки в сервисе, но это можно исправить",
            actionButtonTitle: "Найти друзей"
        )
        return zeroVC
    }
}
