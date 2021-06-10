//
//  RetryManager.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 31.05.2021.
//

import Alamofire
import Apexy

final public class RetryManager: RetryManagerProtocol {
    
    // MARK: - public properties
    
    let maxRetryCount: Int = 3
    let timeCoefficient: Double = 2
    
    // MARK: - private properties
    
    private let tokenService: () -> TokenServiceProtocol
    private let complitionsStorage: ThreadSafeStorage<Request, (RetryResult) -> Void>
    
    // MARK: - Initialization
    
    public init(
        tokenService: @escaping () -> TokenServiceProtocol
    ) {
        self.tokenService = tokenService
        self.complitionsStorage = ThreadSafeStorage<Request, (RetryResult) -> Void>()
    }
    
    // MARK: - Public methods
    
    public func retry(request: Request, with completion: @escaping (RetryResult) -> Void, and error: Error) {
        complitionsStorage.setValue(completion, for: request)
        
        guard request.retryCount < maxRetryCount
        else {
            self.completionRetry(request, with: error)
            return
        }
        if checkErrorToRefreshToken(error) {
            refreshToken { success in
                if success {
                    self.completionRetry(request)
                } else {
                    self.completionRetry(request, with: error)
                }
            }
        } else if checkErrorToRetry(error) {
            self.completionRetry(request)
        } else {
            self.completionRetry(request, with: error)
        }
    }
    
    // MARK: - Public methods
    
    private func refreshToken(_ completion: @escaping (Bool) -> Void) {
        _ = tokenService().refresh(with: "", completion: completion)
    }
    
    private func completionRetry(_ request: Request) {
        guard let completion = complitionsStorage.value(for: request) else { return }
        
        let retryDelay: Double = Double(request.retryCount) * timeCoefficient
        completion(.retryWithDelay(retryDelay))
    }
    
    private func completionRetry(_ request: Request, with error: Error) {
        guard let completion = complitionsStorage.value(for: request) else { return }
        
        completion(.doNotRetryWithError(error))
    }
    
    private func checkErrorToRefreshToken(_ error: Error) -> Bool {
        guard let error = error as? HTTPError
              else { return false }
        return error.statusCode == 401
    }
    
    private func checkErrorToRetry(_ error: Error) -> Bool {
        return checkHTTPError(error) || checkURLError(error)
    }
    
    private func checkURLError(_ error: Error) -> Bool {
        guard let afError = error as? AFError,
              let underlyingError = afError.underlyingError,
              underlyingError as? URLError != nil
              else { return false }
        return true
    }
    
    private func checkHTTPError(_ error: Error) -> Bool {
        guard let error = error as? HTTPError
              else { return false }
        return (300..<600).contains(error.statusCode)
    }
}
