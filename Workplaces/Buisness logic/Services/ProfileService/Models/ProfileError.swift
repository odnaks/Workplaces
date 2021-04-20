//
//  ProfileError.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Foundation

enum ProfileError: ServiceError {
    case defaultError
    case profileError
    
    var description: String {
        switch self {
        case .profileError:
            return "Profile Error"
        default:
            return self.localizedDescription
        }
    }
}
