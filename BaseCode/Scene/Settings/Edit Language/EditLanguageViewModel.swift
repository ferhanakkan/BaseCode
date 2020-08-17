//
//  EditLanguageViewModel.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 17.08.2020.
//

import Foundation

class EditLanguageViewModel {
    
    let languageArray = ["EditLanguageViewController.EditLanguageViewModel.english".localized(),"EditLanguageViewController.EditLanguageViewModel.turkish".localized()]
    
    func checkCurrentLanguage(index: Int) -> Bool {
        let currentLang = AppManager.shared.getLanguage()
        var langTranslitor = ""
        
        if currentLang == "en" {
            langTranslitor = languageArray[0]
        } else if currentLang == "tr" {
            langTranslitor = languageArray[1]
        }
        
        if languageArray[index] == langTranslitor {
            return true
        } else {
            return false
        }
    }
}
