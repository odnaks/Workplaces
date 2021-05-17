//
//  ProfileViewModelMapper.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import WorkplacesAPI

extension ProfileViewModel {
    
    /// Метод для маппинга данных из UserProfile в ProfileViewModel
    public static func map(from data: UserProfile) -> ProfileViewModel {
        let name = "\(data.firstName) \(data.lastName)"
        let years = data.birthDay.getNumberOfYears()
        let photo = data.avatarUrl
        
        return ProfileViewModel(
            name: name,
            years: years,
            photo: photo
        )
    }
    
}
