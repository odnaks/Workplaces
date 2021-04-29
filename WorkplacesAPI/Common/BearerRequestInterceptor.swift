//
//  BearerRequestInterceptor.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 27.04.2021.
//

import Alamofire
import Apexy

/// Implementation of Alamofire.RequestInterceptor.
final public class BearerRequestInterceptor: Alamofire.RequestInterceptor {
    
    // MARK: - Private
    
    /// Contains Base `URL`.
    ///
    /// Must end with a slash character `https://example.com/api/v1/`
    ///
    /// - Warning: declared as open variable for debug purposes only.
    private var baseURL: URL

    private var credentialsStorage: CredentialsStorage
    
    /// Creates a `BaseRequestInterceptor` instance with specified Base `URL`.
    ///
    /// - Parameter baseURL: Base `URL` for adapter.
    public init(
        baseURL: URL,
        credentialsStorage: CredentialsStorage
    ) {
        self.baseURL = baseURL
        self.credentialsStorage = credentialsStorage
    }
    
    // MARK: - Alamofire.RequestInterceptor
    
    public func adapt(
        _ urlRequest: URLRequest,
        for session: Session,
        completion: @escaping (Result<URLRequest, Error>) -> Void) {

        guard let url = urlRequest.url else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        var request = urlRequest
        request.url = appendingBaseURL(to: url)
        request = appendingBearer(to: request)
        
        completion(.success(request))
    }
    
    public func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void) {
        
        return completion(.doNotRetry)
    }
    
    // MARK: - Private methods
    
    private func appendingBaseURL(to url: URL) -> URL {
        URL(string: url.absoluteString, relativeTo: baseURL)!
    }
    
    private func appendingBearer(to request: URLRequest) -> URLRequest {
        guard let token = getToken() else {
            return request
        }
        var requestWithBearer = request
        requestWithBearer.addValue("Bearer \(token.accessToken)", forHTTPHeaderField: "Authorization")
        return requestWithBearer
        
    }
    
    private func getToken() -> Token? {
        return credentialsStorage.token
    }

}
