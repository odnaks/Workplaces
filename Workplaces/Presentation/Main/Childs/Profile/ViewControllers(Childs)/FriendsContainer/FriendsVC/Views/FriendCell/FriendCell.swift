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
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var nicknameLabel: UILabel!
    
    @IBOutlet private var profileTmpView: UIView!
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var profileContainerView: UIView!
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации ячейки друга с переданными данными модели
    func configure(_ model: FriendViewModel) {
        nameLabel.text = model.name
        nicknameLabel.text = model.nickname
    }
    
    // MARK: - Life Circle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundView?.layer.cornerRadius = 24
        profileContainerView.layer.cornerRadius = 16
        profileContainerView.layer.masksToBounds = true
    }
}
