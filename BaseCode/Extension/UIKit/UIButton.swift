//
//  UIButton.swift
//  Cargram
//
//  Created by Ferhan Akkan on 11.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit

extension UIButton {
    func setMyButton(title: String, color: UIColor, background: UIColor, borderColor: UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        cornerRadius = 15
        backgroundColor = background
        layer.borderWidth = 3
        layer.borderColor = borderColor.cgColor
    }
}
