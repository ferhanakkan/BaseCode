//
//  UIView.swift
//  Cargram
//
//  Created by Ferhan Akkan on 11.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

extension UIView {
    
@IBInspectable var cornerRadius: CGFloat {
    get {
        return layer.cornerRadius
    }
    set {
        layer.masksToBounds = true
        layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
    }
}
    
    func roundCornersEachCorner(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
    
    func shadowAndCorner(radius: CGFloat, shadowRadius: CGFloat, opacity: Float, color: UIColor, width: Int, height: Int) {
        layer.cornerRadius = radius
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = opacity
        layer.shadowOffset = CGSize(width: width, height: height)
        layer.shadowColor = color.cgColor
    }
    
    func border(color: UIColor, width: Int) {
        clipsToBounds = true
        layer.masksToBounds = false
        layer.borderWidth = CGFloat(width)
        layer.borderColor = color.cgColor
    }
    func borderAndCorner(radius: CGFloat, color: UIColor, width: Int) {
        layer.cornerRadius = radius
        clipsToBounds = true
        layer.masksToBounds = false
        layer.borderWidth = CGFloat(width)
        layer.borderColor = color.cgColor
    }
    
    func makeRounded() {
        layer.borderWidth = 2
        layer.masksToBounds = false
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
    
}


extension UIView{
    func animShow(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
}

