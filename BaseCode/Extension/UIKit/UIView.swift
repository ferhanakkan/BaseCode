//
//  UIView.swift
//  Cargram
//
//  Created by Ferhan Akkan on 11.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

extension UIView {
    
    static let gradientLayerName: String = "gradientLayer"
    
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
    
    func shadowAndCorner(cornerRadius: CGFloat, shadowRadius: CGFloat, opacity: Float, color: UIColor, width: Int, height: Int) {
        layer.cornerRadius = cornerRadius
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
        layer.masksToBounds = false
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
    
    func rotate(degrees: CGFloat) {
        rotate(radians: CGFloat.pi * degrees / 180.0)
    }

    func rotate(radians: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
    
    
    func setGradientBackground() {
        
        let firstColor = UIColor(red: 120, green: 185, blue: 48, alpha: 1)
        let secondColor = UIColor(red: 0, green: 144, blue: 197, alpha: 1)
        
        let layer = CAGradientLayer()
        layer.frame = self.frame
        layer.colors = [firstColor.cgColor, secondColor.cgColor]

        
    }
    
    func addGradientLayer(colors: [UIColor], type: MKGridentEnum, estimatedFrame: CGRect? = nil) {
            clipsToBounds = true
            
            if let sublayers = self.layer.sublayers {
                for sublayer in sublayers {
                    if sublayer.name == UIView.gradientLayerName {
                        updateGradientLayer(estimatedFrame: estimatedFrame)
                        return
                    }
                }
            }
            
            let gradient = CAGradientLayer()
            gradient.name = UIView.gradientLayerName
            gradient.frame = estimatedFrame ?? bounds
            gradient.colors = colors.map { $0.cgColor }
            
            switch type {
            case MKGridentEnum.horizontal:
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 1, y: 0)
            case MKGridentEnum.vertical:
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 0, y: 1)
            }
            
            gradient.cornerRadius = layer.cornerRadius
            
            layer.insertSublayer(gradient, at: 0)
        }
        
        func updateGradientLayer(estimatedFrame: CGRect? = nil) {
            guard let sublayers = layer.sublayers else { return }
            
            for sublayer in sublayers {
                if sublayer.name == UIView.gradientLayerName {
                    sublayer.frame = estimatedFrame ?? bounds
                    sublayer.cornerRadius = layer.cornerRadius
                }
            }
        }
        
        func removeGradientLayer() {
            guard let sublayers = self.layer.sublayers else { return }
            
            for sublayer in sublayers {
                if sublayer.name == UIView.gradientLayerName {
                    sublayer.removeFromSuperlayer()
                }
            }
        }

    
}


