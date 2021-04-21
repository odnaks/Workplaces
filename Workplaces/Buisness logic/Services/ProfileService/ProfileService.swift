//
//  ProfileService.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Foundation

final class ProfileService: ProfileServiceProtocol {
    
    // MARK: - Initialization
    
    init() {
        //
    }
    
    // MARK: - Public Methods
    
    /// Метод для получения данных профиля.
    /// В completionHanler возвращает модель профиля  и ошибку.
    public func getProfile(
        _ completionHandler: @escaping (Result<ProfileModel, ProfileError>) -> Void
    ) {
        completionHandler(.success(ProfileModel()))
    }

}
