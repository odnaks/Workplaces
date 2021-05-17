//
//  ProfileCardView.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

protocol ProfileCardDelegate: class {
    /// метод, вызываемый при нажатии на кнопку "изменить"
    /// принимает button - нажатая кнопка
    func profileCard(button: UIButton)
}

final class ProfileCardView: XibView {
    
    // MARK: - Public Properties
    
    public weak var delegate: ProfileCardDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var bgView: UIView?
    
    @IBOutlet private weak var profileTmpView: UIView?
    @IBOutlet private weak var profileImageView: UIImageView?
    @IBOutlet private weak var profileContainerView: UIView?
    
    @IBOutlet private weak var nameTitleLabel: UILabel?
    @IBOutlet private weak var ageTitleLabel: UILabel?
    
    // MARK: - Initialization
    
    override func commonInit() {
        
        bgView?.layer.cornerRadius = 24.0
        bgView?.layer.masksToBounds = true
        
        profileContainerView?.layer.cornerRadius = 16.0
        profileContainerView?.layer.masksToBounds = true
        
        profileImageView?.isHidden = true
        profileTmpView?.isHidden = false
        
        nameTitleLabel?.text = ""
        ageTitleLabel?.text = ""
    }
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации профиля с переданными данными модели
    public func configure(with profile: ProfileViewModel?) {
        guard let profile = profile else { return }
        
        nameTitleLabel?.text = profile.name
        
        if let years = profile.years {
            ageTitleLabel?.text = "\(years) лет"
        }
        
        if let image = profile.photo {
            setProfileImage(image)
        }
        
        setNeedsLayout()
    }
    
    // MARK: - Private Methods
    
    private func setProfileImage(_ image: URL) {
        profileImageView?.isHidden = false
        profileTmpView?.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickEdit(_ sender: UIButton) {
        delegate?.profileCard(button: sender)
    }
}
