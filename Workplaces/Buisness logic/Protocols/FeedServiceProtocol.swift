//
//  FeedServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import WorkplacesAPI

/// Сервис для ленты постов
protocol FeedServiceProtocol {
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для получения ленты постов. В completionHanler возвращает массив Post и сообщение об ошибке
    func getFeed(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки post запроса с bearer-кодом в header
    /// для лайка поста с указанным id. В completionHanler возвращает
    /// Void и сообщение об ошибке
    func likePost(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки delete запроса с bearer-кодом в header
    /// для удаления лайка на посте с указанным id.
    /// В completionHanler возвращает Void и сообщение об ошибке
    func dislikePost(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для получения лайкнутых постов. В completionHanler возвращает массив Post и сообщение об ошибке
    func getFavorite(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress
    
    /// Метод для отправки get запроса с bearer-кодом в header
    /// для поиска постов по части текста публикации postData.
    /// В completionHanler возвращает массив Post и сообщение об ошибке
    func searchPost(
        _ postData: String,
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress
}
