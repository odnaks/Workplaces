//
//  FeedService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Foundation

protocol FeedServiceProtocol {
    func getPosts(_ completionHandler: @escaping (Result<[PostModel], FeedError>) -> Void)
    func postPublication(post: PostModel, _ completionHandler: @escaping (FeedError?) -> Void)
}

final class FeedService: FeedServiceProtocol {
    
    // MARK: - Initialization
    
    init() {
        //
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения ленты новостей.
    /// В completionHanler возвращает массив постов и ошибку.
    public func getPosts(_ completionHandler: @escaping (Result<[PostModel], FeedError>) -> Void) {
        completionHandler(.success([PostModel()]))
    }
    
    /// Метод публикации поста. Принимает модель поста.
    /// В completionHanler возвращает ошибку.
    public func postPublication(post: PostModel, _ completionHandler: @escaping (FeedError?) -> Void) {
        completionHandler(nil)
    }
}
