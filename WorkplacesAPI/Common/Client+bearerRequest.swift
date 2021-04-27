//
//  Client+request.swift
//  WorkplacesAPI
//
//  Created by Kseniya Lukoshkina on 27.04.2021.
//

import Apexy

public extension Client {
    
    /// Отправляет реквест с проверкой на токен. Если токен просрочен (HTTPError.statusCode == 403),
    /// то отправляем запрос на обновление токена и при удачном обновлении отправляем запрос с
    /// новым токеном.
    func bearerRequest<T>(
        _ endpoint: T,
        completionHandler: @escaping (APIResult<T.Content>) -> Void
    ) -> Progress where T: Endpoint {
        return self.request(endpoint) { [weak self] requestResult in
            guard let self = self else { return }
            
            switch requestResult {
            case .success:
                completionHandler(requestResult)
            case .failure(let error):
                guard let error = error as? HTTPError,
                      error.statusCode == 403
                else { completionHandler(requestResult); break }
                
                self.refreshToken { refreshResult in
                    switch refreshResult {
                    case .success:
                        _ = self.request(endpoint, completionHandler: completionHandler)
                    case .failure:
                        completionHandler(requestResult)
                    }
                }
                
            }
        }
    }
    
    // MARK: - Private methods
    
    private func refreshToken(completionHandler: @escaping (Result<Void, Error>) -> Void) {
        let credentialsStorage = CredentialsStorage()
        let token = credentialsStorage.getToken()
        
        let refreshEndpoint = RefreshEndpoint(token: token)
        _ = request(refreshEndpoint) { result in
            switch result {
            case .success(let token):
                credentialsStorage.save(token)
                completionHandler(.success(Void()))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
