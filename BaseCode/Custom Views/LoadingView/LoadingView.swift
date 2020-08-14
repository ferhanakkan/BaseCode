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
    
    static var currentView : UIView?
    static var mainViewTarget : UIView?
    static var loadingSubView : UIView?
    
    static func show() {
        guard let currentMainWindow = UIApplication.shared.keyWindow else {
            print("current screen error")
            return
        }
        show(currentMainWindow)
    }
    
    static func show(_ mainView : UIView) {
        
        let subView = UIView()
//        overlay.backgroundColor = UIColor.darkGray.withAlphaComponent(0.8)
        subView.backgroundColor = .clear
        
        mainView.addSubview(subView)
        mainView.bringSubviewToFront(subView)
        
        subView.snp.makeConstraints { (make) in
            make.leading.trailing.bottom.top.equalToSuperview()
        }
        
        loadingSubView = UIView()
        subView.addSubview(loadingSubView!)
        loadingSubView?.cornerRadius = 15
        loadingSubView?.backgroundColor = .lightGray
        loadingSubView?.snp.makeConstraints({ (make) in
            make.height.equalTo(mainView.frame.width*0.2)
            make.width.equalTo(mainView.frame.width*0.2)
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

        currentView = subView
        mainViewTarget = mainView
    }
    
    static func hide() {
        if currentView != nil {
            currentView?.removeFromSuperview()
            currentView =  nil
            mainViewTarget = nil
            loadingSubView?.removeFromSuperview()
            loadingSubView = nil
        }
    }
}

