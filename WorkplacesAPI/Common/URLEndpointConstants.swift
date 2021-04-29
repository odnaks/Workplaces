//
//  URLEndpointConstants.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 27.04.2021.
//

import Foundation

/// Константные урлы для ендпоинтов
public enum API {
    static let registration = URL(string: "auth/registration")!
    static let login = URL(string: "auth/login")!
    static let logout = URL(string: "auth/logout")!
    static let refresh = URL(string: "auth/refresh")!
    
    static let feed = URL(string: "feed")!
    static let favorite = URL(string: "feed/favorite")!
    
    static let me = URL(string: "me")!
    static let friends = URL(string: "me/friends")!
    static let posts = URL(string: "me/posts")!
    
    static let search = URL(string: "search")!
}
