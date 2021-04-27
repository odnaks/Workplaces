//
//  ProfileServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import WorkplacesAPI

/// Сервис для профиля
protocol ProfileServiceProtocol {
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для получения профиля. В completionHanler возвращает
    /// UserProfile и сообщение об ошибке
    func getProfile(
        completion: @escaping (Result<UserProfile, Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки patch запроса с bearer-кодом в header
    /// для изменения информации в профиле. В качестве принимаемого
    /// параметра структура UserProfile,  заполненная свойствами, которые
    /// нужно изменить. В completionHanler возвращает
    /// UserProfile и сообщение об ошибке
    func change(
        _ profile: RequstProfile,
        completion: @escaping (Result<UserProfile, Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для получения друзей. В completionHanler возвращает
    /// массив UserProfile и сообщение об ошибке
    func getFriends(
        completion: @escaping (Result<[UserProfile], Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки post запроса с bearer-кодом в header
    /// для добавления друга с указанным id.
    /// В completionHanler возвращает Void и сообщение об ошибке
    func addFriend(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки delete запроса с bearer-кодом в header
    /// для удаления друга с указанным id.
    /// В completionHanler возвращает Void и сообщение об ошибке
    func deleteFriend(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для получения постов текущего пользователя.
    /// В completionHanler возвращает массив Post и сообщение об ошибке
    func getPosts(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки post запроса с bearer-кодом в header
    /// для добавления поста с параметрами из RequestPost.
    /// В completionHanler возвращает массив Post и сообщение об ошибке
    func addPost(
        _ post: RequstPost,
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для поиска постов по части части имени, фамилии или ника userData.
    /// В completionHanler возвращает массив UserProfile и сообщение об ошибке
    func searchUser(
        _ userData: String,
        completion: @escaping (Result<[UserProfile], Error>) -> Void
    ) -> Progress
}
