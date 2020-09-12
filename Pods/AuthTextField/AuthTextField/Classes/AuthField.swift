//
//  AuthField.swift
//  AuthTextField
//
//  Created by Ferhan Akkan on 22.07.2020.
//

//password icin resim ekle ve autosize ver bi sekilde
//custom edilebilir yap
//fontlari ekle

import UIKit
import SnapKit

public enum InputTypeSelection {
    case email
    case password
    case username
    case name
    case surname
    case phone
    case custom
}

public enum AnimationTypeSelection {
    case shake
    case flash
    case pulse
    case none
}

public class AuthField: UIView {
    
    private let textField = UITextField()
    private let label = UILabel()
    private let borderView = UIView()
    private var showPasswordButton: UIButton?
    private var isPasswordVisiable = false
    private var cleanButton: UIButton?
    
    public var labelFontSmall: UIFont = .systemFont(ofSize: 12)
    public var labelFontLarge: UIFont = .boldSystemFont(ofSize: 15) {
        didSet {
            label.font = labelFontLarge
        }
    }
    
    public var inputType: InputTypeSelection? {
        didSet {
            setView()
        }
    }
    
    public var minCharacter: Int = 3
    
    private var eyeImage: UIImage? = UIImage(named: "eye", in: Bundle(for: AuthField.self), compatibleWith: nil)
    
    private var eyeHiddenImage: UIImage? = UIImage(named: "eyeHidden", in: Bundle(for: AuthField.self), compatibleWith: nil)
    private var cleanImage: UIImage? = UIImage(named: "close", in: Bundle(for: AuthField.self), compatibleWith: nil)
    
    public var isOptional = false
    public var animationType: AnimationTypeSelection = .shake
    public var noticeBorderColor: UIColor = .red
    public var textColor: UIColor = .lightGray {
        didSet {
            borderView.layer.borderColor = textColor.cgColor
            label.textColor = textColor
        }
    }
    
    public var inputColor: UIColor = .lightGray {
        didSet {
            textField.textColor = inputColor
        }
    }
    
    public var deleteButtonColor: UIColor = .blue {
        didSet {
            cleanButton!.setImage(cleanImage!.withRenderingMode(UIImage.RenderingMode.alwaysTemplate), for: .normal)
            cleanButton?.tintColor = deleteButtonColor
        }
    }
    
    public var isDeleteButtonAvaliable = false {
        didSet{
            if isDeleteButtonAvaliable {
                cleanButton = UIButton(type: .system)
                cleanButton?.setBackgroundImage(cleanImage, for: .normal)
                cleanButton?.addTarget(self, action: #selector(cleanButtonTapped), for: .touchUpInside)
                cleanButton?.setTitleColor(deleteButtonColor, for: .normal)
                cleanButton?.translatesAutoresizingMaskIntoConstraints = false
                borderView.addSubview(cleanButton!)
                
                switch inputType {
                case .password:

                    NSLayoutConstraint.activate([
                        cleanButton!.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
                        cleanButton!.widthAnchor.constraint(equalToConstant: 30),
                        cleanButton!.heightAnchor.constraint(equalToConstant: 30),
                        cleanButton!.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10)
                    ])
                    
                    passwordTextFieldRightContraintNonDelete.isActive = false
                    passwordTextFieldRightConstraintWithDelete = showPasswordButton!.trailingAnchor.constraint(equalTo: cleanButton!.leadingAnchor, constant: -10)
                    passwordTextFieldRightConstraintWithDelete.isActive = true
                    self.layoutIfNeeded()
                    
                default:
                    NSLayoutConstraint.activate([
                        cleanButton!.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
                        cleanButton!.widthAnchor.constraint(equalToConstant: 30),
                        cleanButton!.heightAnchor.constraint(equalToConstant: 30),
                        cleanButton!.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10)
                    ])
                    textFieldRightContraintNonDelete.isActive = false
                    textFieldRightConstarintWithDelete = textField.trailingAnchor.constraint(equalTo: cleanButton!.leadingAnchor, constant: -10)
                    textFieldRightConstarintWithDelete.isActive = true
                    self.layoutIfNeeded()
                }
                
            } else {
                switch inputType {
                case .password:
                    passwordTextFieldRightConstraintWithDelete.isActive = false
                    passwordTextFieldRightContraintNonDelete.isActive = true
                default:
                    textFieldRightConstarintWithDelete.isActive = false
                    textFieldRightContraintNonDelete.isActive = true
                }
                cleanButton!.removeFromSuperview()
//                cleanButton = nil
                self.layoutIfNeeded()
            }
        }
    }
    
//MARK: - Constraints
    
    private lazy var textFieldRightContraintNonDelete = textField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10)
    private lazy var textFieldRightConstarintWithDelete = textField.trailingAnchor.constraint(equalTo: cleanButton!.leadingAnchor, constant: -10)
    
    private lazy var passwordTextFieldRightContraintNonDelete = showPasswordButton!.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -10)
    
    private lazy var passwordTextFieldRightConstraintWithDelete = showPasswordButton!.trailingAnchor.constraint(equalTo: cleanButton!.leadingAnchor, constant: -10)
    
    private lazy var centerConstraint = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    private lazy var topConstraint = label.centerYAnchor.constraint(equalTo: self.topAnchor)
    
}

//MARK: - Set View

extension AuthField {
    
    private func setView() {
        textField.delegate = self
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        borderView.translatesAutoresizingMaskIntoConstraints = false
        
        setTextField()
    }
    
    private func setTextField() {
        
        self.addSubview(borderView)
        borderView.addSubview(textField)
        
        borderView.layer.borderColor = textColor.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 15
        
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.topAnchor),
            borderView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        self.addSubview(label)
        label.textColor = .lightGray
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
        ])
        
        if inputType == InputTypeSelection.password {
            
            showPasswordButton = UIButton(type: .system)
            borderView.addSubview(showPasswordButton!)

            label.text = "Password"
            
            textField.textContentType = .password
            textField.isSecureTextEntry = true
            
            
            showPasswordButton!.setBackgroundImage(eyeHiddenImage, for: .normal)
            showPasswordButton!.addTarget(self, action: #selector(eyeButtonPressed), for: .touchUpInside)
            showPasswordButton?.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                showPasswordButton!.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
                showPasswordButton!.widthAnchor.constraint(equalToConstant: 30),
                showPasswordButton!.heightAnchor.constraint(equalToConstant: 30),
            ])
            
            passwordTextFieldRightContraintNonDelete.isActive = true
            
            NSLayoutConstraint.activate([
                textField.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -5),
                textField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
                textField.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 5),
                textField.trailingAnchor.constraint(equalTo: self.showPasswordButton!.leadingAnchor, constant: -5)
            ])
                    
        } else {
            
            NSLayoutConstraint.activate([
                textField.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -5),
                textField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 10),
                textField.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 5),
            ])
            
            textFieldRightContraintNonDelete.isActive = true

            switch inputType {
            case .name:
                label.text = "Name"
                self.textField.keyboardType = .namePhonePad
            case .surname:
                label.text = "Surname"
                self.textField.keyboardType = .namePhonePad
            case .username:
                label.text = "Username"
                self.textField.keyboardType = .namePhonePad
            case .email:
                label.text = "E-Mail"
                self.textField.keyboardType = .emailAddress
            case .phone:
                label.text = "Phone"
                self.textField.keyboardType = .numberPad
            default:
                return
            }
            
        }
    }
    
    public func setUnderLineBorder() {
        
        borderView.layer.borderColor = UIColor.clear.cgColor
        borderView.layer.borderWidth = 0
        borderView.layer.cornerRadius = 0
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: borderView.frame.height - 1, width: borderView.frame.width, height: 1.0)
        bottomLine.backgroundColor = textColor.cgColor
        borderView.layer.addSublayer(bottomLine)
    }
    
    public func setFourCornerBorder() {
        borderView.layer.sublayers?.removeLast()
        borderView.layer.borderColor = textColor.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 15
    }
}

//MARK: - Button Actions

extension AuthField {
    
    @objc func eyeButtonPressed() {
        isPasswordVisiable = !isPasswordVisiable
        if isPasswordVisiable {
            showPasswordButton!.setBackgroundImage(eyeImage, for: .normal)
            textField.isSecureTextEntry = false
        } else {
            showPasswordButton!.setBackgroundImage(eyeHiddenImage, for: .normal)
            textField.isSecureTextEntry = true
        }
    }
    
    @objc func cleanButtonTapped() {
        textField.text?.removeAll()
    }
}

//MARK: - TextField Delegate

extension AuthField: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        expansionView(isOpen: true)
    }
    
    public func textFieldDidChangeSelection(_ textField: UITextField) {
        if isOptional {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        } else if textField.text!.isEmpty {
            borderView.layer.borderColor = noticeBorderColor.cgColor
            self.label.textColor = noticeBorderColor
        } else {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        }
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        expansionView(isOpen: false)
        
        if isOptional {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        } else if !checkField() {
            borderView.layer.borderColor = noticeBorderColor.cgColor
            self.label.textColor = noticeBorderColor
        } else {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        }
    }
    
}


//MARK: - Animation

extension AuthField {
    
    private func showAnimation() {
        
        switch animationType {
        case .flash:
            let animation = CABasicAnimation(keyPath: "opacity")
            animation.duration = 0.5
            animation.fromValue = 1
            animation.toValue = 0.1
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            animation.autoreverses = true
            animation.repeatCount = 3
            layer.add(animation, forKey: "flash")        case .pulse:
            let animation = CASpringAnimation(keyPath: "transform.scale")
            animation.duration = 0.6
            animation.fromValue = 0.95
            animation.toValue = 1
            animation.autoreverses = true
            animation.repeatCount = 2
            animation.initialVelocity = 0.5
            layer.add(animation, forKey: "pulse")
        case .shake:
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
            layer.add(animation, forKey: "position")
        case .none:
            return
        }
    }
    
    private func expansionView(isOpen: Bool) {
        if isOpen {
            label.backgroundColor = .white
            label.font = labelFontSmall
            
            centerConstraint.isActive = false
            topConstraint.isActive = true
            
            UIView.animate(withDuration: 0.4, animations: {
                self.layoutIfNeeded()
            }) { (_) in
                
            }
        } else {
            if textField.text!.isEmpty {
                label.backgroundColor = .clear
                label.font = labelFontLarge
                centerConstraint.isActive = true
                topConstraint.isActive = false
                UIView.animate(withDuration: 0.4, animations: {
                    self.layoutIfNeeded()
                }) { (_) in
                    print("Animation Completed!!!")
                }
            }
        }
        
    }
}

//MARK: - Validation

extension AuthField {
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    
    public func checkField() -> Bool {
        
        if isOptional {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        } else if textField.text!.count < minCharacter {
            borderView.layer.borderColor = noticeBorderColor.cgColor
            self.label.textColor = noticeBorderColor
        } else {
            borderView.layer.borderColor = textColor.cgColor
            self.label.textColor = textColor
        }
        
        if isOptional {
            return true
        } else {
            switch inputType {
            case .name:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            case .surname:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            case .email:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                validateEmail(enteredEmail: textField.text!) ? nil : showAnimation()
                return validateEmail(enteredEmail: textField.text!)
            case .password:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            case .none:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            case .phone:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            case .custom:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            case .username:
                textField.text!.count >= minCharacter ? nil : showAnimation()
                return textField.text!.count >= minCharacter
            }
        }
    }
    
}

//MARK: - Custom Textfield

extension AuthField {
    
    public func setCustomAuthField(isOptional: Bool, animationType: AnimationTypeSelection, noticeColor: UIColor, textColor: UIColor, textfieldInputColor: UIColor, textFieldInputFont: UIFont, titleLabelSmallSizeFont: UIFont, titleLabelLargeSizeFont: UIFont, placeHolderText: String, requiredMinCharacter: Int, isDeleteButtonAvaliable: Bool, deleteButtonColor: UIColor) {
        
        self.inputType = .custom
        self.isOptional = isOptional
        self.animationType = animationType
        self.noticeBorderColor = noticeColor
        self.textColor = textColor
        self.textField.textColor = textfieldInputColor
        self.textField.font = textFieldInputFont
        self.labelFontSmall = titleLabelSmallSizeFont
        self.labelFontLarge = titleLabelLargeSizeFont
        self.label.text = placeHolderText
        self.minCharacter = requiredMinCharacter
        self.isDeleteButtonAvaliable = isDeleteButtonAvaliable
        self.deleteButtonColor = deleteButtonColor
    }
    
    public func setLabelText(_ text: String) {
        label.text = text
    }
    
}

