//
//  UIFont.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 10.08.2020.
//

import UIKit

extension UIFont {
    
//    Test your files real font name with this func
//    for family in UIFont.familyNames.sorted() {
//        let names = UIFont.fontNames(forFamilyName: family)
//        print("Family: \(family) Font names: \(names)")
//    }
    
    class func worksansSemiBold(fontSize: CGFloat) -> UIFont {
        return UIFont(name: Constants.Font.wordsansSemibold, size: CGFloat(fontSize))!
    }

}
