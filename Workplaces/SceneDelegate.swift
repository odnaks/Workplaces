//
//  SceneDelegate.swift
//  Workplaces
//
//  Created by Kseniya Lukoshkina on 17.04.2021.
//

import UIKit

enum GlobalFlags {
    static var isTesting: Bool {
        UserDefaults.standard.bool(forKey: "isTesting")
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard !GlobalFlags.isTesting else { return }
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let zeroFabric = ZeroFabric()
        
        let rootViewController = RootCoordinatingController(
            rootFabric: RootFabric(
                authorizationFabric: AuthorizationFabric(
                    registrationFabric: RegistrationFabric()
                ),
                mainFabric: MainFabric(
                    profileFabric: ProfileFabric(
                        myPostsFabric: MyPostsFabric(
                            zeroFabric: zeroFabric
                        ),
                        likedPostsFabric: LikedPostsFabric(
                            zeroFabric: zeroFabric
                        ),
                        friendsFabric: FriendsFabric(
                            zeroFabric: zeroFabric
                        )
                    ),
                    homeFabric: HomeFabric(
                        homeVoidContainerFabric: HomeVoidFabric(
                            zeroFabric: zeroFabric
                        ),
                        zeroFabric: zeroFabric
                    )
                )
            )
        )
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = rootViewController
        self.window = window
        window.makeKeyAndVisible()
    }
    
}
