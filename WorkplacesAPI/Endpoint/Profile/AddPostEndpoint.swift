//
//  AddPostEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

import Apexy

public struct AddPostEndpoint: JsonEndpoint {
    
    public typealias Content = [Post]
    
    private let newPost: RequstPost

    public init(post: RequstPost) {
        self.newPost = post
    }
    
    public func makeRequest() throws -> URLRequest {
        return post(
            API.posts,
            queryItems: [
                URLQueryItem(name: "text", value: newPost.text),
                URLQueryItem(name: "image_file", value: String(decoding: newPost.imageFile ?? Data(), as: UTF8.self)),
                URLQueryItem(name: "lon", value: String(newPost.lon)),
                URLQueryItem(name: "lat", value: String(newPost.lat))
            ]
        )
    }

}
