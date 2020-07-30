//
//  AppManager.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 30.07.2020.
//

import UIKit

struct AppManager {
    
    static var shared = AppManager()
    
    //MARK: - Internet Connection
    let reachability: Reachability = try! Reachability(hostname: "google.com")

    func setReachability() {
        do {
            try reachability.startNotifier()
        } catch {
            assertionFailure("Unable to start\nnotifier")
        }

        reachability.whenUnreachable = { reachability in
            if self.reachability.connection == .unavailable {
//                self.messagePresent(title: "Internet Connection Lost", message: "Please retry again", type: .error, isInternet: .isInternetAlert)
            }
        }
    }
    
    func checkInternetStatus() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                if self.reachability.connection == .unavailable {
//                self.messagePresent(title: "Internet Connection Lost", message: "Please retry again", type: .error, isInternet: .isInternetAlert)
            }
        }
    }
    
    //MARK: - Custom Alert
    
//    func messagePresent(title: String, message: String, type: ImageType, isInternet: InternetAlert) {
//        let vc = AlertView()
//        vc.titleLabel.text = title
//        vc.messagelabel.text = message
//        vc.imageTypeSelector = type
//        vc.internetConnectionButtonSelector = isInternet
//        vc.modalPresentationStyle = .overFullScreen
//        UIApplication.getPresentedViewController()!.present(vc, animated: true)
//    }
}
