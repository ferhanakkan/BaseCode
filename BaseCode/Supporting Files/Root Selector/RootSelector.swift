//
//  RootSelector.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 13.08.2020.
//

import UIKit

class RootSelector {
    
    init() {
        UIApplication.getPresentedViewController()?.view.window?.rootViewController = Tabbar.createTabBar()
//        let userDefaults = UserDefaults.standard
//        if let autoLogIn = userDefaults.value(forKey: Constants.Api.autoLogIn) as? Bool , let _ = userDefaults.value(forKey: Constants.Api.token) as? String {
//
//            if autoLogIn {
//                UIApplication.getPresentedViewController()?.view.window?.rootViewController = Tabbar.createTabBar()
//            } else {
//                userDefaults.setValue(nil, forKey: Constants.Api.token)
//                userDefaults.setValue(nil, forKey: Constants.Api.autoLogIn)
//                UIApplication.getPresentedViewController()?.view.window?.rootViewController = ExampleViewController()
//            }
//
//
//        } else {
//            UIApplication.getPresentedViewController()?.view.window?.rootViewController = ExampleViewController()
//        }
    }
}

