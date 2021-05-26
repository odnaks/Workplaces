//
//  RegistrationViewModelMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 24.05.2021.
//

import WorkplacesAPI

extension RegistrationViewModel {
    
    /// Метод для маппинга данных из RegistrationViewModel в UserCredentials
    static func mapToUserCredentials(from data: RegistrationViewModel) -> UserCredentials {
        return UserCredentials(
            email: data.email,
            password: data.password
        )
    }
    
    /// Метод для маппинга данных из RegistrationViewModel в RequestProfile
    static func mapToRequestProfile(from data: RegistrationViewModel) -> RequestProfile {
        let dateFormatter = DateFormatter.yyyyMMdd
        let birthdayString = dateFormatter.string(from: data.birthday ?? Date())
        return RequestProfile(
            firstName: data.firstName,
            lastName: data.lastName,
            nickname: data.nickName,
            avatarFile: " ",
            birthDay: birthdayString
        )
    }
}
