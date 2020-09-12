# AuthTextField

<p align="center">
<img src='https://github.com/ferhanakkan/AuthTextField/blob/master/Example/Pods/Resources/Assets.xcassets/logo.imageset/logo.png' width="200" />
</p>

AuthTextField allows you to easily create and validate animated textfields on the authentication screens for your applications.

[![CI Status](https://img.shields.io/travis/ferhanakkan/AuthTextField.svg?style=flat)](https://travis-ci.org/ferhanakkan/AuthTextField)
[![Version](https://img.shields.io/cocoapods/v/AuthTextField.svg?style=flat)](https://cocoapods.org/pods/AuthTextField)
[![License](https://img.shields.io/cocoapods/l/AuthTextField.svg?style=flat)](https://cocoapods.org/pods/AuthTextField)
[![Platform](https://img.shields.io/cocoapods/p/AuthTextField.svg?style=flat)](https://cocoapods.org/pods/AuthTextField)

<img src="https://github.com/ferhanakkan/Weather-App/blob/master/Weather%20App/Assets.xcassets/general.dataset/general.gif" width="220" height="400"/>

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Author](#author)
- [License](#license)

## Requirements
- iOS 12+
- Swift 5+
- Xcode 10+

## Installation

AuthTextField is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'AuthTextField'
```

## Usage 

### Quick Start

#### Programmatically usage

```swift

import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    let nameTextfield = AuthField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextfield.inputType = .name
        
        self.view.addSubview(nameTextfield)
        nameTextfield.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextfield.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            nameTextfield.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            nameTextfield.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameTextfield.heightAnchor.constraint(equalToConstant: 50)

        ])
    }

}
```
#### Storyboard Usage

Firstly insert UIView object in your view than enter in identitiy inspector and change inside Custom Class -> Class to AuthField. Connect your UIView to ViewController.swift file.

<p align="center">
<img src='https://github.com/ferhanakkan/AuthTextField/blob/master/Example/Pods/Resources/Assets.xcassets/identitiy.imageset/Screen%20Shot%202020-07-23%20at%2015.18.58.png' width="220" />
</p>

```swift

import UIKit
import AuthTextField

class ViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.inputType = .name
    }
    
}
```

### Detail Usage

#### Validation 

You can check your textfield does give your requirements and it return you true false result.  If result is fault trigger animation.

```swift

import UIKit
import AuthTextField

class ViewController: UIViewController {
    

    @IBOutlet weak var nameTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.inputType = .name
        nameTextField.checkField()
    }
    
}
```
#### Default Properties


```swift

public var inputType: InputTypeSelection? 
public var isOptional = false 
public var animationType: AnimationTypeSelection = .shake 
public var noticeBorderColor: UIColor = .red 
public var textColor: UIColor = .lightGray 
public var inputColor: UIColor = .lightGray 
public var labelFontSmall: UIFont = .systemFont(ofSize: 12)  
public var labelFontLarge: UIFont = .boldSystemFont(ofSize: 15)  
public var minCharacter: Int = 3 
public var isDeleteButtonAvaliable = false
```

#### Delete Button

Add your textfield a delete button and set buttons color.
```swift 
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.inputType = .password
        passwordTextField.isDeleteButtonAvaliable = false
        passwordTextField.deleteButtonColor = .blue
    }
    
}
``` 


#### Animations 

For animation type we have 3 types. Shake, pulse and flash. If you don't want any animation you have to select .animationType = .none

<img src="https://github.com/ferhanakkan/Weather-App/blob/master/Weather%20App/Assets.xcassets/animation.dataset/animation.gif" width="220" height="400"/>

```swift
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTextField: AuthField!
    @IBOutlet weak var secondTextField: AuthField!
    @IBOutlet weak var thirdTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.inputType = .name
        secondTextField.inputType = .name
        thirdTextField.inputType = .name
        
        //Setting animation Preset animationType = .shake
        
        firstTextField.animationType = .shake
        secondTextField.animationType = .pulse
        thirdTextField.animationType = .flash
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        firstTextField.checkField()
        secondTextField.checkField()
        thirdTextField.checkField()
    }
    
}
```
#### Password

<img src="https://github.com/ferhanakkan/Weather-App/blob/master/Weather%20App/Assets.xcassets/password.dataset/password.gif" width="220" height="400"/>

```swift 
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.inputType = .password
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        passwordTextField.checkField()
    }
    
}
``` 
#### Email Validation

<img src="https://github.com/ferhanakkan/Weather-App/blob/master/Weather%20App/Assets.xcassets/email.dataset/email.gif" width="220" height="400"/>

If input type selected e-mail when you gonna validate textfield it will be automatically check e-mail format.

class ViewController: UIViewController {
```swift 
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.inputType = .email
    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        emailTextField.checkField()
    }
    
}
``` 

#### Create Custom AuthField

<img src="https://github.com/ferhanakkan/Weather-App/blob/master/Weather%20App/Assets.xcassets/custom.dataset/custom.gif" width="220" height="400"/>

```swift
import UIKit
import AuthTextField

class ViewController: UIViewController {
    
    @IBOutlet weak var customFirstTextField: AuthField!
    @IBOutlet weak var customSecondTextField: AuthField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customFirstTextField.inputType = .custom
        customFirstTextField.setCustomAuthField(isOptional: true, animationType: .flash, noticeColor: .red, textColor: .lightGray, textfieldInputColor: .purple, textFieldInputFont: .systemFont(ofSize: 15), titleLabelSmallSizeFont: .systemFont(ofSize: 12), titleLabelLargeSizeFont: .boldSystemFont(ofSize: 15), placeHolderText: "Custom First Optional", requiredMinCharacter: 1)

        customSecondTextField.inputType = .custom
        customTextField.setCustomAuthField(isOptional: true, animationType: .flash, noticeColor: .blue, textColor: .orange, textfieldInputColor: .orange, textFieldInputFont: .boldSystemFont(ofSize: 15), titleLabelSmallSizeFont: .systemFont(ofSize: 12), titleLabelLargeSizeFont: .boldSystemFont(ofSize: 15), placeHolderText: "Custom", requiredMinCharacter: 5, isDeleteButtonAvaliable: false, deleteButtonColor: .blue)

    }
    
    @IBAction func validateButtonPressed(_ sender: Any) {
        customFirstTextField.checkField()
        customSecondTextField.checkField()
    }
    
}

```

## Author

ferhanakkan, ferhanakkan@gmail.com

## License

AuthTextField is available under the MIT license. See the LICENSE file for more info.



