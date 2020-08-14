//
//  String.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 13.08.2020.
//

import Foundation

extension String {
    
    func localized() -> String {
        
//        if let _ = UserDefaults.standard.string(forKey: "lang") {} else {
//            UserDefaults.standard.setValue("en", forKey: "lang")
//        }
//
//        let lang = UserDefaults.standard.string(forKey: "lang")
//        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
//        let bundle = Bundle(path: path!)
        
        return NSLocalizedString(self, tableName: nil, bundle: AppManager.shared.bundle, value: "", comment: "")
    }
}


