//
//  UserDefaults.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 13.08.2020.
//

import Foundation

enum Language: String {
    case english = "en"
    case turkish = "tr"
}

extension UserDefaults {
    
    class func setLanguage(language: Language) {
        self.standard.setValue(language.rawValue, forKey: "lang")
    }
}
