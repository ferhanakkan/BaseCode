//
//  ForgotCollectionViewCell.swift
//  Cargram
//
//  Created by Ferhan Akkan on 11.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import AuthTextField

class ForgotColletionViewCell: UICollectionViewCell {
    
    let mainView = UIView()
    let title = UILabel()
    let mailInput = AuthField()
    let resetButton = UIButton(type: .system)
    let bottomLabel = UILabel()
    let logInButton = UIButton(type: .system)
    
    var delegate: CollectionViewIndexSelector?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setMainView()
        setTitle()
        setMailInput()
        setResetButton()
        setBottomLabel()
        setLogInButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
}

    //MARK: - Setup UI
extension ForgotColletionViewCell {
    
    private func setMainView() {
        contentView.addSubview(mainView)
        mainView.backgroundColor = .white
        mainView.shadowAndCorner(radius: 20, shadowRadius: 7, opacity: 0.6, color: .black, width: 5, height: 5)
        mainView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setTitle() {
        mainView.addSubview(title)
        title.snp.makeConstraints { (make) in
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        title.numberOfLines = 0
        title.text = "We will send you a mail to reset your password"
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.textAlignment = .center
        title.textColor = .black
    }
    
    private func setMailInput() {
        mainView.addSubview(mailInput)
        mailInput.inputType = .email
        mailInput.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
    }
    
    private func setResetButton() {
        mainView.addSubview(resetButton)
        resetButton.snp.makeConstraints { (make) in
            make.top.equalTo(mailInput.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        resetButton.authTypeButton(title: "Reset Password")
        resetButton.addTarget(self, action: #selector(resetButtonPressed), for: .touchUpInside)
        
    }
    
    private func setBottomLabel() {
        mainView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(resetButton.snp.bottom).offset(20)
            make.bottom.equalToSuperview().inset(20)
        }
        bottomLabel.text = "Did you remember your password?"
        bottomLabel.numberOfLines = 0
        bottomLabel.textColor = .black
    }
    
    private func setLogInButton() {
        mainView.addSubview(logInButton)
        logInButton.snp.makeConstraints { (make) in
            make.leading.equalTo(bottomLabel.snp.trailing).offset(5)
            make.trailing.equalToSuperview().inset(20)
            make.centerY.equalTo(bottomLabel.snp.centerY)
            make.width.equalTo(50)
        }
        logInButton.setTitleColor(.orange, for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
    }
    
}

//MARK: - Actions

extension ForgotColletionViewCell {
    @objc func resetButtonPressed() {
        let mailStatus = mailInput.checkField()
        if mailStatus {
            
        }
    }
    
    @objc func logInButtonPressed() {
        delegate?.selectedCollectionViewIndex(row: 1)
    }
}
