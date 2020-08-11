//
//  SceneDelegate.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 30.07.2020.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let newScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: newScene)
        selectRoot()
        window?.makeKeyAndVisible()
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        UserDefaults.standard.setValue(0, forKey: Constants.Badge.badgeNumber)
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    private func selectRoot() {
//            window?.rootViewController = Tabbar.createTabBarWithNavigationBar()
        window?.rootViewController = AuthViewController()
    }

}
