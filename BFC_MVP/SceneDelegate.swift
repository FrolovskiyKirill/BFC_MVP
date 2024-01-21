//
//  SceneDelegate.swift
//  BFC_MVP
//
//  Created by Kirill Frolovskiy on 20.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        let navBarController = UINavigationController(rootViewController: tabBarController)
        
        let homeViewController = HomeAssambly.makeModule()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        let accountViewController = AccountViewController()
        accountViewController.tabBarItem = UITabBarItem(title: "Account", image: nil, tag: 1)
        
        tabBarController.viewControllers = [homeViewController, accountViewController]
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navBarController
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

