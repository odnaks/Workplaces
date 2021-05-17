//
//  MyPostsContainerController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class MyPostsContainerController: UIViewController {

    // MARK: - Private Properties
    
    private let voidController: ZeroViewController
    private let newPostViewController: NewPostViewController
    private let postsViewController: ListPostsViewController
    
    private var posts: [PostViewModel]?
    
    // MARK: - Initialization
    
    init(
        myPostsFabric: MyPostsFabric
    ) {
        self.voidController = myPostsFabric.getMyPostsVoidController()
        self.newPostViewController = myPostsFabric.getNewPostViewController()
        self.postsViewController = myPostsFabric.getMyPostsViewController()
        
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
        postsViewController.configure(with: posts)
        
        switchChild(
            viewControllerToHide: voidController,
            viewControllerToShow: postsViewController,
            containerView: view
        )
    }
    
    private func showNewPostViewController() {
        self.present(newPostViewController, animated: true)
    }

}

// MARK: - ZeroViewControllerDelegate

extension MyPostsContainerController: ZeroViewControllerDelegate {
    func zeroViewController() {
        showNewPostViewController()
    }
}
