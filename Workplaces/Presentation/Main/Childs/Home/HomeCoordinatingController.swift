//
//  HomeCoordinatingController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 16.05.2021.
//

import UIKit

final class HomeCoordinatingController: UIViewController {
    
    // MARK: - Private Properties
    
    private let feedService: FeedServiceProtocol
    
    private let postsViewController: ListPostsViewController
    private let homeVoidContainerController: HomeVoidContainerController
    
    // MARK: - Initialization
    
    init(
        feedService: FeedServiceProtocol = ServiceLayer.shared.feedService,
        homeFabric: HomeFabric
    ) {
        self.feedService = feedService
        
        self.postsViewController = homeFabric.getPostsViewController()
        self.homeVoidContainerController = homeFabric.getVoidContainerController()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle

    override func viewDidLoad() {
        super.viewDidLoad()

        showVoidContainer()
    }
    
    // MARK: - Private Methods
    
    private func showVoidContainer() {
        showChild(homeVoidContainerController, to: view)
    }
    
}
