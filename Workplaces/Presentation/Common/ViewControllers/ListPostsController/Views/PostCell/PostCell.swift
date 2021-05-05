//
//  PostCell.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

class PostCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "PostCell"
    
    // MARK: - Outlets
    
    @IBOutlet private weak var bgView: UIView?
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var geoLabel: UILabel?
    
    @IBOutlet private weak var photoContainer: UIView?
    @IBOutlet private weak var nicknameLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView?.layer.cornerRadius = 24
        photoContainer?.layer.cornerRadius = 12
    }
    
}
