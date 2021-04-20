//
//  FeedError.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Foundation

enum FeedError: ServiceError {
    case defaultError
    case feedError
    
    var description: String {
        switch self {
        case .feedError:
            return "Feed Error"
        default:
            return self.localizedDescription
        }
    }
}
