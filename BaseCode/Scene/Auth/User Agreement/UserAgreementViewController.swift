//
//  UserAgreementViewController.swift
//  Cargram
//
//  Created by Ferhan Akkan on 13.06.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import SnapKit

class UserAgreementViewController: UIViewController {
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+40000)
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView(frame: .zero)
        return scroll
    }()
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User Agreements"
        setUI()
    }
}

//MARK: - Setup UI

extension UserAgreementViewController: UIScrollViewDelegate {
    
    func setUI() {
        view.backgroundColor = .white
        scrollView.backgroundColor = .white
        scrollView.maximumZoomScale = 4
        scrollView.minimumZoomScale = 1
        scrollView.delegate = self
        scrollView.contentSize = contentViewSize
        label.numberOfLines = 0
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let topView = UIView()
        scrollView.addSubview(topView)
        topView.backgroundColor = .gray
        topView.snp.makeConstraints { (make) in
            make.height.equalTo(60)
            make.top.equalToSuperview()
            make.width.equalTo(self.view.frame.width)
            make.centerX.equalToSuperview()
        }
        let button = UIButton(type: .system)
        topView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
        button.setTitle("UserAgreementViewController.done".localized(), for: .normal)
        button.titleLabel?.font = .worksansSemiBold(fontSize: 20)
        button.tintColor = .white
        button.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        
        
        scrollView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
            make.width.equalTo(self.view.frame.width-10)
            make.centerX.equalToSuperview()
        }
        label.text = "UserAgreementViewController.userAgreement".localized()
    }
    
    @objc func donePressed() {
        dismiss(animated: true, completion: nil)
    }
}
