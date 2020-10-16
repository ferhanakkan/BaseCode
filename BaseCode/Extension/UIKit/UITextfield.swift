//
//  UITextfield.swift
//  Cargram
//
//  Created by Ferhan Akkan on 13.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

extension UITextField {
     func updatePlaceHolder(_ text: String, color: UIColor) {
         attributedPlaceholder = NSAttributedString(string: text,
                                                    attributes: [NSAttributedString.Key.foregroundColor: color])
     }
    
    var isEmpty: Bool {
        if let text = self.text, !text.isEmpty {
            return false
        }
        return true
    }
 }
