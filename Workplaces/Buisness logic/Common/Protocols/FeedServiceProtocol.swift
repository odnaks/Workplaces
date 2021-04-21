//
//  FeedServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import Foundation

protocol FeedServiceProtocol {
    func getPosts(_ completionHandler: @escaping (Result<[PostModel], FeedError>) -> Void)
    func postPublication(post: PostModel,
                         _ completionHandler: @escaping (FeedError?) -> Void
    )
}
