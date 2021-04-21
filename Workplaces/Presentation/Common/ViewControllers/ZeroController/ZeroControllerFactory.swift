//
//  ZeroControllerFactory.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 22.04.2021.
//

import Foundation

enum ZeroControllerType: String {
    case errorController = "ErrorZeroViewController"
    case voidController = "VoidZeroViewController"
}

protocol ZeroControllerFactoryProtocol {
    func getZeroController(by type: ZeroControllerType) -> ZeroViewController?
}

final class ZeroControllerFactory: ZeroControllerFactoryProtocol {
    
    public func getZeroController(by type: ZeroControllerType) -> ZeroViewController? {
        return ZeroViewController(nibName: type.rawValue, bundle: nil)
    }
    
}
