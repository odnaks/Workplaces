//
//  FriendSearchCell.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 18.05.2021.
//

import UIKit

protocol FriendSearchCellDelegate: AnyObject {
    
    /// метод, вызываемый, когда пользователь нажал кнопку добавления друга
    func friendSearchCellAddFriend(_ friendID: String)
}

final class FriendSearchCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "FriendSearchCell"
    
    // MARK: - Public Properties
    
    weak var delegate: FriendSearchCellDelegate?
    
    var isAdded: Bool = false {
        didSet {
            updatePlus()
        }
    }
    
    // MARK: - Private properties
    
    var friendModel: FriendViewModel?
    
    // MARK: - Outlets
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var nicknameLabel: UILabel!
    
    @IBOutlet private var profileTmpView: UIView!
    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var profileContainerView: UIView!
    
    @IBOutlet private var plusButton: UIButton!
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации ячейки друга с переданными данными модели
    func configure(_ model: FriendViewModel) {
        nameLabel.text = model.name
        nicknameLabel.text = model.nickname
        friendModel = model
    }
    
    // MARK: - Life Circle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileContainerView.layer.cornerRadius = 16
        profileContainerView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        nicknameLabel.text = nil
        isAdded = false
    }
    
    // MARK: - Private Methods
    
    private func updatePlus() {
        plusButton.isHidden = isAdded
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapPlus(_ sender: Any) {
        guard let model = friendModel else { return }
        
        isAdded.toggle()
        delegate?.friendSearchCellAddFriend(model.id)
    }
    
}
