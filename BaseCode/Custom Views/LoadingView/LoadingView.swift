//
//  LoadingView.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 10.08.2020.
//

import UIKit
import NVActivityIndicatorView
import SnapKit

class LoadingView {
    
    static var currentOverlay : UIView?
    static var currentOverlayTarget : UIView?
    static var loadingSubView : UIView?
    
    static func show() {
        guard let currentMainWindow = UIApplication.shared.keyWindow else {
            print("current screen error")
            return
        }
        show(currentMainWindow)
    }
    
    static func show(_ overlayTarget : UIView) {
        
        let overlay = UIView()
//        overlay.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        overlay.backgroundColor = .clear
        
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubviewToFront(overlay)
        
        overlay.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        
        loadingSubView = UIView()
        overlay.addSubview(loadingSubView!)
        loadingSubView?.cornerRadius = 15
        loadingSubView?.backgroundColor = .lightGray
        loadingSubView?.snp.makeConstraints({ (make) in
            make.height.equalTo(overlayTarget.frame.width*0.2)
            make.width.equalTo(overlayTarget.frame.width*0.2)
            make.center.equalToSuperview()
        })

        
        let loadingInducator = NVActivityIndicatorView(frame: .zero, type: .pacman, color: .white, padding: .none)
        loadingSubView?.addSubview(loadingInducator)
        loadingInducator.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
            make.bottom.trailing.equalToSuperview().inset(20)
            make.center.equalToSuperview()
        }
        loadingInducator.startAnimating()

        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
    }
    
    static func hide() {
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
            currentOverlayTarget = nil
            loadingSubView?.removeFromSuperview()
            loadingSubView = nil
        }
    }
}

