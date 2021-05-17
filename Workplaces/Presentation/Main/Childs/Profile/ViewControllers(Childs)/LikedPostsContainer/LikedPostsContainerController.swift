//
//  LikedPostsContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

protocol LikedPostsContainerControllerDelegate: class {
    
    /// метод, вызываемый при нажатии на кнопку "перейти к ленте"
    func likedPostsContainerControllerToHome()

}

final class LikedPostsContainerController: UIViewController {
    
    // MARK: - Public properties
    
    public weak var delegate: LikedPostsContainerControllerDelegate?

    // MARK: - Private Properties
    
    private let voidController: ZeroViewController
    private let likedPostsViewController: ListPostsViewController
    
    private var posts: [PostViewModel]?
    
    // MARK: - Initialization
    
    init(
        likedPostsFabric: LikedPostsFabric
    ) {
        self.voidController = likedPostsFabric.getLikedPostsVoidController()
        self.likedPostsViewController = likedPostsFabric.getLikedPostsViewController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации загруженных постов в таблицу
    public func configure(with posts: [PostViewModel]) {
        if !posts.isEmpty {
            self.posts = posts
            showListPosts()
        }
    }
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        showVoidController()
    }
    
    // MARK: - Private Methods
    
    private func showVoidController() {
        voidController.delegate = self
        
        showChild(voidController, to: view)
    }
    
    private func showListPosts() {
        likedPostsViewController.configure(with: posts)
        
        switchChild(
            viewControllerToHide: voidController,
            viewControllerToShow: likedPostsViewController,
            containerView: view
        )
    }
    
    private func showHome() {
        delegate?.likedPostsContainerControllerToHome()
    }

}

// MARK: - ZeroViewControllerDelegate

extension LikedPostsContainerController: ZeroViewControllerDelegate {
    func zeroViewController() {
        showHome()
    }
}
