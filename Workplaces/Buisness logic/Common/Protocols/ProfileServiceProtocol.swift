//
//  ProfileServiceProtocol.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import Foundation

protocol ProfileServiceProtocol {
    func getProfile(_ completionHandler: @escaping (Result<ProfileModel, ProfileError>) -> Void)
}
