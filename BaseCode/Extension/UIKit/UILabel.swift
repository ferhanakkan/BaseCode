//
//  UILabel.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 10.08.2020.
//

import UIKit

extension UILabel {
    
    func underlineMyText(rangeArray: [String], underlinedFont: UIFont, underlinedColor: UIColor) {
        if let textString = self.text {

            let str = NSString(string: textString)
            let attributedString = NSMutableAttributedString(string: textString)
            
            for range in rangeArray {
                let selectedRange = str.range(of: range)
                
                attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: selectedRange)
                attributedString.addAttributes([NSAttributedString.Key.font: underlinedFont as Any, NSAttributedString.Key.foregroundColor: underlinedColor], range: selectedRange)
            }
            
            attributedText = attributedString
        }
    }
}
