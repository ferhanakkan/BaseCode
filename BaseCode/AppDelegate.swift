//
//  AppDelegate.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 30.07.2020.
//

import UIKit
import IQKeyboardManagerSwift
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppManager.shared.setReachability()
        firebase(application)
        setKeyboard()
        autoLogIn()
//        setLocalePushNotification()
        
        
        if #available(iOS 13.0, *) { }
        else {
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.selectRoot()
            self.window?.makeKeyAndVisible()
        }
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        UserDefaults.standard.setValue(0, forKey: Constants.Badge.badgeNumber)
        UIApplication.shared.applicationIconBadgeNumber = 0
    }


    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    private func selectRoot() {
        window?.rootViewController = ExampleViewController()
//        if let rememberMe = UserDefaults.standard.value(forKey: "rememberMe") as? Bool {
//            if !rememberMe {
//                UserDefaults.standard.setValue(nil, forKey: "profileImage")
//                UserDefaults.standard.setValue(nil, forKey: "rememberMe")
//                let firebaseAuth = Auth.auth()
//                do {
//                    try firebaseAuth.signOut()
//                } catch let signOutError as NSError {
//                    print ("Error signing out: %@", signOutError)
//                    LoadingView.hide()
//                }
//            }
//        }
//        window?.rootViewController = Tabbar.createTabBarWithNavigationBar()
    }

    private func setKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    private func autoLogIn() {
        
//        if let rememberData = UserDefaults.standard.value(forKey: "rememberMe") as? Bool {
//            if !rememberData {
//                let firebaseAuth = Auth.auth()
//                do {
//                    try firebaseAuth.signOut()
//                } catch let signOutError as NSError {
//                    print ("Error signing out: %@", signOutError)
//                }
//            }
//        }
    }

}

