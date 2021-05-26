//
//  ListPostsViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 04.05.2021.
//

import UIKit

enum ListPostsType {
    case feed
    case myPosts
    case myLiked
}

protocol ListPostsViewControllerDelegate: AnyObject {
    
    /// метод, вызываемый при скроле вниз
    func listPostsViewControllerScrollToBottom()
    
    /// метод, вызываемый при скроле вверх
    func listPostsViewControllerScrollToTop()
    
    /// метод, вызываемый нажатии кропки лайка
    func listPostsViewControllerLike(_ post: PostViewModel)

}

final class ListPostsViewController: UIViewController {
    
    // MARK: - Public properties
    
    weak var delegate: ListPostsViewControllerDelegate?
    
    // MARK: - IBOutlet
    
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private let listPostsType: ListPostsType
    private var dataSource: ListPostsDataSource = ListPostsDataSource()
    private var posts: [PostViewModel]?
    private var previousContentOffset: CGFloat = 0
    
    // MARK: - Public Methods
    
    /// Метод для конфигурации постов с переданными данными модели
    func configure(with model: [PostViewModel]?) {
        self.posts = model
        setupTableViewModel()
    }
    
    // MARK: - Initialization

    init(
        listPostsType: ListPostsType = .feed
    ) {
        self.listPostsType = listPostsType
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGrey
        view.layoutMargins = listPostsType == .feed ? .feed : .standart
        setupTableView()
    }
    
    // MARK: - Private Methods
    
    private func setupTableView() {
        dataSource.viewController = self
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.register(
            UINib(nibName: "\(PostCell.self)", bundle: nil),
            forCellReuseIdentifier: PostCell.identifier
        )
    }
    
    private func setupTableViewModel() {
        dataSource.viewModel = posts
        tableView.reloadData()
    }
}

// MARK: - PostCellDelegate

extension ListPostsViewController: PostCellDelegate {
    func postCellLike(_ post: PostViewModel) {
        delegate?.listPostsViewControllerLike(post)
    }
}

// MARK: - UITableViewDelegate

extension ListPostsViewController: UITableViewDelegate, UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        previousContentOffset = scrollView.contentOffset.y
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if previousContentOffset > scrollView.contentOffset.y {
            delegate?.listPostsViewControllerScrollToTop()
        } else if previousContentOffset < scrollView.contentOffset.y {
            delegate?.listPostsViewControllerScrollToBottom()
        }
    }
}
