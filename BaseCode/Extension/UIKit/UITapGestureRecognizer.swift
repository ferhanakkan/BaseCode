//
//  UITapGestureRecognizer.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 10.08.2020.
//

import UIKit

extension UITapGestureRecognizer {
    
    //Usage

//    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
//        guard let text = label.text else { return }
//        let yare = (text as NSString).range(of: "yare")
//        if gesture.didTapAttributedTextInLabel(label: self.label, inRange: yare) {
//            print("yar")
//        }
//    }
//
//    label.lineBreakMode = .byWordWrapping
//    label.isUserInteractionEnabled = true
//
//    let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tappedOnLabel(_:)))
//    tapGesture.numberOfTouchesRequired = 1
//    label.addGestureRecognizer(tapGesture)

   func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
       guard let attributedText = label.attributedText else { return false }

       let mutableStr = NSMutableAttributedString.init(attributedString: attributedText)
       mutableStr.addAttributes([NSAttributedString.Key.font : label.font!], range: NSRange.init(location: 0, length: attributedText.length))

       // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
       let layoutManager = NSLayoutManager()
       let textContainer = NSTextContainer(size: CGSize.zero)
       let textStorage = NSTextStorage(attributedString: mutableStr)

       // Configure layoutManager and textStorage
       layoutManager.addTextContainer(textContainer)
       textStorage.addLayoutManager(layoutManager)

       // Configure textContainer
       textContainer.lineFragmentPadding = 0.0
       textContainer.lineBreakMode = label.lineBreakMode
       textContainer.maximumNumberOfLines = label.numberOfLines
       let labelSize = label.bounds.size
       textContainer.size = labelSize

       // Find the tapped character location and compare it to the specified range
       let locationOfTouchInLabel = self.location(in: label)
       let textBoundingBox = layoutManager.usedRect(for: textContainer)
       let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
                                         y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
       let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x,
                                                    y: locationOfTouchInLabel.y - textContainerOffset.y);
       let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
       return NSLocationInRange(indexOfCharacter, targetRange)
   }

}
