//
//  AnimatedSplashViewController.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 13.08.2020.
//

import UIKit
import SwiftyGif

class AnimatedSplashViewController: UIViewController, SwiftyGifDelegate {
    
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        
        do {
            let gif = try UIImage(gifName: "logoGif.gif")
            self.imageView = UIImageView(gifImage: gif, loopCount: 1)
        } catch {
            print(error)
        }
        
        imageView.delegate = self
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
        view.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        view.layoutIfNeeded()
    }
    
    
    func gifDidStop(sender: UIImageView) {
        self.view.window?.rootViewController = UINavigationController(rootViewController: ExampleViewController())
    }
    
    func setRoot() {
        
    }
    
}
