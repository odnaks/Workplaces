//
//  StackViewController.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 12.05.2021.
//

import UIKit

class StackViewController: UIViewController {

    // MARK: - Private Properties
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 3
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var arrangedViewControllers: [UIViewController] = []
    
    // MARK: - Initialization
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        setupStackView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Life Circle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGrey
    }
    
    // MARK: - Setup Methods
    
    private func setupStackView() {
        view.addSubview(stackView)
        stackView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
        ])
    }
    
    // MARK: - Public Methods
    
    /// Добавляет childViewController в stackView
    public func addArrangedViewController(_ child: UIViewController) {
        arrangedViewControllers.append(child)
        add(child)
    }
    
    /// Добавляет childViewController в stackView с заданием высоты
    public func addArrangedViewController(_ child: UIViewController, height: CGFloat) {
        arrangedViewControllers.append(child)
        add(child, height: height)
    }
    
    /// удаляет childViewController из stackView
    public func removeArrangedViewController(_ child: UIViewController) {
        guard let index = arrangedViewControllers.firstIndex(of: child)
        else { return }
        
        arrangedViewControllers.remove(at: index)
        remove(child)
    }
    
    /// Добавляет view в stackView
    public func addArrangedSubview(_ view: UIView) {
        stackView.addArrangedSubview(view)
    }
    
    /// Добавляет view в stackView c заданием высоты view
    public func addArrangedSubview(_ view: UIView, height: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: height)])
        stackView.addArrangedSubview(view)
    }
    
    // MARK: - Private Methods
    
    private func add(_ child: UIViewController) {
        addArrangedSubview(child.view)
        addChild(child)
    }
    
    private func add(_ child: UIViewController, height: CGFloat) {
        addArrangedSubview(child.view, height: height)
        addChild(child)
    }
    
    private func remove(_ child: UIViewController) {
        child.willMove(toParent: nil)
        child.view.removeFromSuperview()
        child.removeFromParent()
    }
}
