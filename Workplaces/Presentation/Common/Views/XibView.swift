//
//  XibView.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 21.04.2021.
//

import UIKit

class XibView: UIView {
    
    // MARK: - IBOutlet
    
    @IBOutlet private var contentView: UIView?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        let nibName = String(describing: type(of: self))
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        guard let contentView = contentView else { return }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
        commonInit()
    }
    
    func commonInit() {}
}
