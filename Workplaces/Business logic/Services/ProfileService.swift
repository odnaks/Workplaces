//
//  ProfileService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Apexy
import WorkplacesAPI

final class ProfileService: APIService, ProfileServiceProtocol {
    
    // MARK: - Public Methods
    
    public func getProfile(
        completion: @escaping (Result<UserProfile, Error>) -> Void
    ) -> Progress {
        let endpoint = ProfileEndpoint()
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func change(
        _ profile: RequestProfile,
        completion: @escaping (Result<UserProfile, Error>) -> Void
    ) -> Progress {
        let endpoint = ChangeProfileEndpoint(profile: profile)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func getFriends(
        completion: @escaping (Result<[UserProfile], Error>) -> Void
    ) -> Progress {
        let endpoint = FriendsEndpoint()
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func addFriend(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = AddFriendEndpoint(friendId: id)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func deleteFriend(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = DeleteFriendEndpoint(friendId: id)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func getPosts(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = ProfilePostsEndpoint()
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func addPost(
        _ post: RequestPost,
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = AddPostEndpoint(post: post)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }
    
    public func searchUser(
        _ userData: String,
        completion: @escaping (Result<[UserProfile], Error>) -> Void
    ) -> Progress {
        let endpoint = SearchUserEndpoint(userData: userData)
        return apiClient.bearerRequest(endpoint, completionHandler: completion)
    }

}
