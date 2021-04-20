//
//  UIFont.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 19.04.2021.
//

import UIKit

private enum IBMPlexSansName: String {
    case regular = "IBMPlexSans"
    case medium = "IBMPlexSans-Medium"
}

extension UIFont {
    
    static var title: UIFont {
        return sourceIBMPlex(.regular, size: 36)
    }
    
    static var subTitle: UIFont {
        return sourceIBMPlex(.medium, size: 28)
    }
    
    static var bodyLarge: UIFont {
        return sourceIBMPlex(.regular, size: 16)
    }
    
    static var bodySmall: UIFont {
        return sourceIBMPlex(.regular, size: 14)
    }
    
    private static func sourceIBMPlex(_ name: IBMPlexSansName,
                                      size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name.rawValue, size: size) else {
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        return font
    }
}
