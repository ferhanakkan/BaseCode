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

class LogInColletionViewCell: UICollectionViewCell {
    
    let mainView = UIView()
    let emailInput = UITextField()
    let passwordInput = UITextField()
    let eyeButton = UIButton()
    let rememberLabel = UILabel()
    let checkBox = BEMCheckBox()
    let resetPasswordButton = UIButton()
    let logInButton = UIButton()
    let bottomSubView = UIView()
    let bottomLabel = UILabel()
    let registerButton = UIButton()
    
    var delegate: CollectionViewIndexSelector?
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setMainView()
        setEmailInput()
        setPasswordInput()
        setEye()
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
        emailInput.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        emailInput.placeholder = "E-mail"
        emailInput.keyboardType = .emailAddress
        emailInput.borderStyle = .roundedRect
    }
    
    private func setPasswordInput() {
        mainView.addSubview(passwordInput)
        passwordInput.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.equalTo(emailInput.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        passwordInput.placeholder = "Password"
        passwordInput.isSecureTextEntry = true
        passwordInput.borderStyle = .roundedRect
        passwordInput.isSecureTextEntry = true
    }
    
    private func setEye() {
        mainView.addSubview(eyeButton)
        eyeButton.snp.makeConstraints { (make) in
            make.height.width.equalTo(30)
            make.centerY.equalTo(passwordInput.snp.centerY)
            make.trailing.equalToSuperview().inset(30)
        }
        eyeButton.setImage(UIImage(named: "eyeHidden"), for: .normal)
        eyeButton.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
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
        logInButton.backgroundColor = .gray
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.setTitle("Log In", for: .normal)
        logInButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
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
        rememberMeSetter()

    }
    
    @objc private func eyeButtonPressed() {
        passwordInput.isSecureTextEntry = !passwordInput.isSecureTextEntry
        DispatchQueue.main.async {
            self.setEyeImage()
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
            UserDefaults.standard.setValue(true, forKey: "rememberMe")
        } else {
           UserDefaults.standard.setValue(false, forKey: "rememberMe")
        }
    }
    
    private func setEyeImage() {
        if passwordInput.isSecureTextEntry {
            eyeButton.setImage(UIImage(named: "eyeHidden"), for: .normal)
        } else {
            eyeButton.setImage(UIImage(named: "eye"), for: .normal)
        }
    }
}
