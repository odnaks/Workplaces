//
//  SceneDelegate.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 17.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let navController = UINavigationController(rootViewController: StartViewController())
        navController.navigationBar.isHidden = true
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navController
        self.window = window
        window.makeKeyAndVisible()
    }
    
}
