//
//  String.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 13.08.2020.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: AppManager.shared.bundle, value: "", comment: "")
    }
}


