//
//  ServiceError.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 20.04.2021.
//

import Foundation

protocol ServiceError: Error {
    var description: String { get }
}
