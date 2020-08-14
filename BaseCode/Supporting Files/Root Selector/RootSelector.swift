//
//  RootSelector.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 13.08.2020.
//

import UIKit

class RootSelector {
    
    init() {
        let userDefaults = UserDefaults.standard
        if let autoLogIn = userDefaults.value(forKey: Constants.Api.autoLogIn) as? Bool , let _ = userDefaults.value(forKey: Constants.Api.token) as? String {
            
            if autoLogIn {
                //In App Action
            } else {
                userDefaults.setValue(nil, forKey: Constants.Api.token)
                userDefaults.setValue(nil, forKey: Constants.Api.autoLogIn)
                UIApplication.getPresentedViewController()?.view.window?.rootViewController = AuthViewController()
            }
            
            
        } else {
            UIApplication.getPresentedViewController()?.view.window?.rootViewController = AuthViewController()
        }
    }
}

