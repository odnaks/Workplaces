//
//  PostCell.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

protocol PostCellDelegate: AnyObject {
    
    /// метод, вызываемый при нажатии на кнопку лайка
    func postCellLike(_ post: PostViewModel)
}

final class PostCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifier = "PostCell"
    
    // MARK: - Public properties
    
    weak var delegate: PostCellDelegate?
    
    var isLiked: Bool = false {
        didSet {
            updateLike()
        }
    }
    
    // MARK: - Private properties
    
    var postModel: PostViewModel?
    
    // MARK: - Outlets
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var geoLabel: UILabel!
    
    @IBOutlet private var photoContainer: UIView!
    @IBOutlet private var nicknameLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации ячейки поста с переданными данными модели
    func configure(_ model: PostViewModel) {
        postModel = model
        titleLabel.text = model.text
        geoLabel.text = model.address
        nicknameLabel.text = model.authorNickname
        isLiked = model.isLiked
    }
    
    // MARK: - Life Circle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundView?.layer.cornerRadius = 24
        photoContainer.layer.cornerRadius = 12
        layoutMargins = .standart
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0))
    }
    
    // MARK: - Private Methods
    
    private func updateLike() {
        let imageButton: UIImage = isLiked ? .iconHeartLiked : .iconHeart
        likeButton.setImage(imageButton, for: .normal)
    }
    
    // MARK: - IBAction
    
    @IBAction private func didTapLike(_ sender: Any) {
        isLiked.toggle()
        
        guard let post = postModel else { return }
        delegate?.postCellLike(post)
    }
    
}
