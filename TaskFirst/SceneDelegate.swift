//
//  SceneDelegate.swift
//  TaskFirst
//
//  Created by Максим Михеев on 16.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        
        let viewController = TeamMembersViewController()
        let projectNavigationController = UINavigationController(rootViewController: viewController)
        
        window.rootViewController = projectNavigationController
        
        self.window = window
        window.makeKeyAndVisible()
    }

}

