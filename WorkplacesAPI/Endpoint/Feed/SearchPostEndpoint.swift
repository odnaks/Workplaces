//
//  SearchPostEndpoint.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 26.04.2021.
//

public struct SearchPostEndpoint: JsonEndpoint {
    
    public typealias Content = [Post]
    
    private let postData: String
    
    public init(postData: String) {
        self.postData = postData
    }
    
    public func makeRequest() throws -> URLRequest {
        guard let url = URL(string: "search?post=\(postData)")
        else { throw APIError.parametersInvalid }
        
        return get(url)
    }

}
