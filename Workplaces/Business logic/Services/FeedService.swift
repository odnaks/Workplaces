//
//  FeedService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Apexy
import WorkplacesAPI

final class FeedService: APIService, FeedServiceProtocol {
    
    // MARK: - Public Methods
    
    func getFeed(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = FeedEndpoint()
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    func likePost(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = LikePostEndpoint(id: id)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    func dislikePost(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = DislikePostEndpoint(id: id)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    func getFavorite(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = FavoriteEndpoint()
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    func searchPost(
        _ postData: String,
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = SearchPostEndpoint(postData: postData)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
}
