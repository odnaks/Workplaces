//
//  ProfileCardViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 12.05.2021.
//

import UIKit

protocol ProfileCardDelegate: class {
    /// метод, вызываемый при нажатии на кнопку "изменить"
    /// принимает button - нажатая кнопка
    func profileCardEdit()
    
    /// метод, вызываемый при нажатии на кнопку "logout"
    /// принимает button - нажатая кнопка
    func profileCardLogout()
}

final class ProfileCardViewController: UIViewController {

    // MARK: - Public Properties
    
    public weak var delegate: ProfileCardDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private weak var bgView: UIView?
    
    @IBOutlet private weak var profileTmpView: UIView?
    @IBOutlet private weak var profileImageView: UIImageView?
    @IBOutlet private weak var profileContainerView: UIView?
    
    @IBOutlet private weak var nameTitleLabel: UILabel?
    @IBOutlet private weak var ageTitleLabel: UILabel?
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
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
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        bgView?.layer.cornerRadius = 24.0
        bgView?.layer.masksToBounds = true
        
        profileContainerView?.layer.cornerRadius = 16.0
        profileContainerView?.layer.masksToBounds = true
        
        profileImageView?.isHidden = true
        profileTmpView?.isHidden = false
        
        nameTitleLabel?.text = ""
        ageTitleLabel?.text = ""
    }
    
    private func setProfileImage(_ image: URL) {
        profileImageView?.isHidden = false
        profileTmpView?.isHidden = true
    }
    
    // MARK: - IBAction
    
    @IBAction private func clickEdit(_ sender: UIButton) {
        delegate?.profileCardEdit()
    }
    
    @IBAction private func clickLogout(_ sender: Any) {
        delegate?.profileCardLogout()
    }
    
}
