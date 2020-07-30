//
//  UIViewController.swift
//  Cargram
//
//  Created by Ferhan Akkan on 17.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

extension UIViewController: UNUserNotificationCenterDelegate {
    
    // Uygulama açıkken bir bildirimin geldiğini belirtir.
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
    
    /// Uygulama açıkken gelen bildirimlerin ekranda gözükmesini sağlayan fonksiyon
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
