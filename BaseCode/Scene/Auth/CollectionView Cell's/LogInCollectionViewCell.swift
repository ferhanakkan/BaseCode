//
//  LogInCollectionViewCell.swift
//  Cargram
//
//  Created by Ferhan Akkan on 11.05.2020.
//  Copyright © 2020 Ferhan Akkan. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
import BEMCheckBox
import AuthTextField

class LogInColletionViewCell: UICollectionViewCell {
    
    let mainView = UIView()
    let emailInput = AuthField()
    let passwordInput = AuthField()
    let rememberLabel = UILabel()
    let checkBox = BEMCheckBox()
    let resetPasswordButton = UIButton(type: .system)
    let logInButton = UIButton(type: .system)
    let bottomSubView = UIView()
    let bottomLabel = UILabel()
    let registerButton = UIButton(type: .system)
    
    var delegate: CollectionViewIndexSelector?
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setMainView()
        setEmailInput()
        setPasswordInput()
        setRememberLabel()
        setCheckBox()
        setResetPasswordButton()
        setLoginButton()
        setBottomSubView()
        setBottomLabel()
        setRegisterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
}

    //MARK: - Setup UI
extension LogInColletionViewCell {
    
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
    
    private func setEmailInput() {
        mainView.addSubview(emailInput)
        emailInput.inputType = .email
        emailInput.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setPasswordInput() {
        mainView.addSubview(passwordInput)
        passwordInput.inputType = .password
        passwordInput.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.equalTo(emailInput.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setRememberLabel() {
        mainView.addSubview(rememberLabel)
        rememberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(passwordInput.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(40)
        }
        rememberLabel.text = "Remember Me"
    }
    
    private func setCheckBox() {
        mainView.addSubview(checkBox)
        checkBox.snp.makeConstraints { (make) in
            make.height.width.equalTo(15)
            make.centerY.equalTo(rememberLabel)
            make.leading.equalTo(rememberLabel.snp.trailing).offset(10)
        }
        checkBox.onTintColor = .orange
        checkBox.onCheckColor = .orange
    }
    
    private func setResetPasswordButton() {
        mainView.addSubview(resetPasswordButton)
        resetPasswordButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordInput.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.leading.greaterThanOrEqualTo(checkBox.snp.trailing)
            make.height.equalTo(40)
            make.width.equalTo(140)
        }
        resetPasswordButton.setTitleColor(.orange, for: .normal)
        resetPasswordButton.setTitle("Reset Password", for: .normal)
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordPressed), for: .touchUpInside)
    }
    
    private func setLoginButton() {
        mainView.addSubview(logInButton)
        logInButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(rememberLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        logInButton.authTypeButton(title: "Log In")
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
    }
    
    private func setBottomSubView() {
        mainView.addSubview(bottomSubView)
        bottomSubView.snp.makeConstraints { (make) in
            make.top.equalTo(logInButton.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setBottomLabel() {
        bottomSubView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        bottomLabel.text = "Did you register ?"
        bottomLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    private func setRegisterButton() {
        bottomSubView.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomLabel.snp.centerY)
            make.leading.equalTo(bottomLabel.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(80)
        }
        registerButton.setTitle("Register", for: .normal)
        registerButton.setTitleColor(.orange, for: .normal)
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }
}


//MARK: - Actions

extension LogInColletionViewCell {
    
    @objc private func logInButtonPressed() {
        let passwordStatus = passwordInput.checkField()
        let emailStatus = emailInput.checkField()
        
        if emailStatus && passwordStatus {
            
        }
    }
    
    @objc private func registerButtonPressed() {
        self.delegate?.selectedCollectionViewIndex(row: 0)
    }

    @objc private func resetPasswordPressed() {
        self.delegate?.selectedCollectionViewIndex(row: 2)
    }
    
    private func rememberMeSetter() {
        if checkBox.on {
            UserDefaults.standard.setValue(true, forKey: Constants.Api.autoLogIn)
        } else {
           UserDefaults.standard.setValue(false, forKey: Constants.Api.autoLogIn)
        }
    }

}
