//
//  RegisterCollectionViewCell.swift
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

class RegisterColletionViewCell: UICollectionViewCell {
    
    let mainView = UIView()
    let emailInput = AuthField()
    let passwordInput = AuthField()
    let usernameInput = AuthField()
    let userAgreementLabel = UILabel()
    let userAgreementCheckBox = BEMCheckBox()
    let rememberLabel = UILabel()
    let checkBox = BEMCheckBox()
    let registerButton = UIButton(type: .system)
    let bottomSubView = UIView()
    let bottomLabel = UILabel()
    let logInButton = UIButton(type: .system)
    
    var delegate: CollectionViewIndexSelector?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setMainView()
        setEmailInput()
        setPasswordInput()
        setUsernameInput()
        setuserAgremmentLabel()
        setUserAgrementCheckBox()
        setRememberLabel()
        setCheckBox()
        setRegisterButton()
        setBottomSubView()
        setBottomLabel()
        setLogInButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init has not been implemented")
    }
}

//MARK: - Setup UI
extension RegisterColletionViewCell {
    
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
    
    
    private func setUsernameInput() {
        mainView.addSubview(usernameInput)
        usernameInput.inputType = .username
        usernameInput.snp.makeConstraints { (make) in
            make.height.equalTo(40)
            make.top.equalTo(passwordInput.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func setuserAgremmentLabel() {
        mainView.addSubview(userAgreementLabel)
        userAgreementLabel.snp.makeConstraints { (make) in
            make.top.equalTo(usernameInput.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        userAgreementLabel.numberOfLines = 0
        userAgreementLabel.text = "By creating an account, you accept our User Agreements ."
        userAgreementLabel.underlineMyText(rangeArray: ["User Agreements"], underlinedFont: .boldSystemFont(ofSize: 16), underlinedColor: .red)
        userAgreementLabel.lineBreakMode = .byWordWrapping
        userAgreementLabel.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tappedOnLabel(_:)))
        tapGesture.numberOfTouchesRequired = 1
        userAgreementLabel.addGestureRecognizer(tapGesture)
        userAgreementLabel.isUserInteractionEnabled = true
    }
    
    private func setUserAgrementCheckBox() {
        mainView.addSubview(userAgreementCheckBox)
        userAgreementCheckBox.snp.makeConstraints { (make) in
            make.height.width.equalTo(15)
            make.centerY.equalTo(userAgreementLabel)
            make.leading.equalTo(userAgreementLabel.snp.trailing).offset(10)
            make.trailing.lessThanOrEqualTo(mainView.snp.trailing).inset(30)
        }
        userAgreementCheckBox.onTintColor = .orange
        userAgreementCheckBox.onCheckColor = .orange
    }
    
    private func setRememberLabel() {
        mainView.addSubview(rememberLabel)
        rememberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userAgreementLabel.snp.bottom).offset(10)
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
    
    private func setRegisterButton() {
        mainView.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(rememberLabel.snp.bottom).offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        registerButton.authTypeButton(title: "Register")
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
    }
    
    private func setBottomSubView() {
        mainView.addSubview(bottomSubView)
        bottomSubView.snp.makeConstraints { (make) in
            make.top.equalTo(registerButton.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    private func setBottomLabel() {
        bottomSubView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
        bottomLabel.text = "Did you register before?"
        bottomLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    private func setLogInButton() {
        bottomSubView.addSubview(logInButton)
        logInButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(bottomLabel.snp.centerY)
            make.leading.equalTo(bottomLabel.snp.trailing)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.orange, for: .normal)
        logInButton.addTarget(self, action: #selector(logInPressed), for: .touchUpInside)
    }
}

//MARK: - Actions

extension RegisterColletionViewCell {
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = userAgreementLabel.text else { return }
        let yare = (text as NSString).range(of: "User Agreements")
        if gesture.didTapAttributedTextInLabel(label: self.userAgreementLabel, inRange: yare) {
            let vc = UserAgreementViewController()
            UIApplication.getPresentedViewController()!.present(vc, animated: true)
        }
    }
    
    @objc private func logInPressed() {
        delegate?.selectedCollectionViewIndex(row: 1)
    }
    
    @objc private func registerButtonPressed() {
        let usernameStatus = usernameInput.checkField()
        let passwordStatus = passwordInput.checkField()
        let emailStatus = emailInput.checkField()
        
        if emailStatus && passwordStatus && usernameStatus {
            
        }
    }
    
    private func rememberMeSetter() {
        if checkBox.on {
            UserDefaults.standard.setValue(true, forKey: Constants.Api.autoLogIn)
        } else {
            UserDefaults.standard.setValue(false, forKey: Constants.Api.autoLogIn)
        }
    }
}
