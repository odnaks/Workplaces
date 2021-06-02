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
    
    func getProfile(
        completion: @escaping (Result<UserProfile, Error>) -> Void
    ) -> Progress {
        let endpoint = ProfileEndpoint()
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func change(
        _ profile: RequestProfile,
        completion: @escaping (Result<UserProfile, Error>) -> Void
    ) -> Progress {
        let endpoint = ChangeProfileEndpoint(profile: profile)
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func getFriends(
        completion: @escaping (Result<[UserProfile], Error>) -> Void
    ) -> Progress {
        let endpoint = FriendsEndpoint()
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func addFriend(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = AddFriendEndpoint(friendId: id)
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func deleteFriend(
        with id: String,
        completion: @escaping (Result<Void, Error>) -> Void
    ) -> Progress {
        let endpoint = DeleteFriendEndpoint(friendId: id)
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func getPosts(
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = ProfilePostsEndpoint()
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func addPost(
        _ post: RequestPost,
        completion: @escaping (Result<[Post], Error>) -> Void
    ) -> Progress {
        let endpoint = AddPostEndpoint(post: post)
        return apiClient.request(endpoint, completionHandler: completion)
    }
    
    func searchUser(
        _ userData: String,
        completion: @escaping (Result<[UserProfile], Error>) -> Void
    ) -> Progress {
        let endpoint = SearchUserEndpoint(userData: userData)
        return apiClient.request(endpoint, completionHandler: completion)
    }

}
