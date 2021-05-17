//
//  FriendCell.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 11.05.2021.
//

import UIKit

final class FriendCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "FriendCell"
    
    // MARK: - Outlets
    
    @IBOutlet private weak var bgView: UIView?
    @IBOutlet private weak var nameLabel: UILabel?
    @IBOutlet private weak var nicknameLabel: UILabel?
    
    @IBOutlet private weak var profileTmpView: UIView?
    @IBOutlet private weak var profileImageView: UIImageView?
    @IBOutlet private weak var profileContainerView: UIView?
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации ячейки друга с переданными данными модели
    public func configure(_ model: FriendViewModel) {
        nameLabel?.text = model.name
        nicknameLabel?.text = model.nickname
    }
    
    // MARK: - Life Circle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        bgView?.layer.cornerRadius = 24
        profileContainerView?.layer.cornerRadius = 16
        profileContainerView?.layer.masksToBounds = true
    }
}
