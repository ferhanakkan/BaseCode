//
//  Tabbar.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 17.08.2020.
//

import UIKit

class Tabbar {
    class func createTabBar() -> UITabBarController {
        
        let tabController = UITabBarController()
        
        let navigationArray = [UINavigationController(rootViewController: ExampleViewController()), UINavigationController(rootViewController: AuthViewController())]
        
        for index in 0 ..< navigationArray.count {
            navigationArray[index].navigationBar.barTintColor = .darkGray
            navigationArray[index].navigationBar.backgroundColor = .gray
            navigationArray[index].navigationBar.tintColor = .orange
        }
        
        tabController.viewControllers = navigationArray
        
        tabController.tabBar.backgroundColor = .gray
        tabController.tabBar.barTintColor = .darkGray
        tabController.tabBar.tintColor = .orange
        
        tabController.tabBar.items?[0].image = UIImage(named: "success")
        tabController.tabBar.items![0].selectedImage = UIImage(named: "success")
        tabController.tabBar.items![0].title = "Example"
        
        tabController.tabBar.items?[1].image = UIImage(named: "success")
        tabController.tabBar.items![1].selectedImage = UIImage(named: "success")
        tabController.tabBar.items![1].title = "Auth"

        return tabController
    }
}
