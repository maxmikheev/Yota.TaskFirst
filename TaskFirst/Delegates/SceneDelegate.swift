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
        
        let teamMembersVc = TeamMembersViewController()
        let projectNavigationController = UINavigationController(rootViewController: teamMembersVc)
        
        window.rootViewController = projectNavigationController
        
        self.window = window
        window.makeKeyAndVisible()
    }

}

