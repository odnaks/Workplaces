//
//  TitleHeader.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

final class TitleHeader: XibView {
    
    // MARK: - IBOutlet
    
    @IBOutlet private var titleLabel: UILabel!
    
    // MARK: - Public properties
    
    override var intrinsicContentSize: CGSize {
        let height: CGFloat = 60.0
        return CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
    
    // MARK: - Public methods
    
    func setTitle(_ title: String) {
        titleLabel.text = title
    }
    
    func hide() {
        isHidden = true
    }
    
    func show() {
        isHidden = false
    }
    
}
