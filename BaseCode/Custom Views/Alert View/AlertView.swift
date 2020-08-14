//
//  AlertView.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 14.08.2020.
//

import UIKit
import SnapKit

final class AlertView: UIViewController {
    
    //MARK: - Properties
    var titleLabel: UILabel = UILabel()
    var messagelabel: UILabel = UILabel()
    var imageView: UIImageView = UIImageView()
    var mainView: UIView = UIView()
    
    var okButton = UIButton()
    var retryButton: UIButton? = nil
    
    lazy var imageTypeSelector: ImageType = .error
    lazy var internetConnectionButtonSelector: InternetAlert = .nonInternetAlert
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(displayP3Red: 9/255, green: 18/255, blue: 17/255, alpha: 0.0)
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.mainView.alpha = 1
            self.view.backgroundColor = UIColor(displayP3Red: 9/255, green: 18/255, blue: 17/255, alpha: 1.0)
            self.view.layoutIfNeeded()
        }
    }
    
    
    //MARK: - Setup UI
    
    private func setUI() {
        setMainView()
        setImageView()
        setTitle()
        setMessage()
        setOkButton()
        setRetryButton()
    }
    private func setMainView() {
        view.addSubview(mainView)
        mainView.alpha = 0
        mainView.snp.makeConstraints { (make) in
            make.height.equalTo(UIScreen.main.bounds.height*0.6)
            make.width.equalTo(350)
            make.center.equalToSuperview()
        }
        mainView.cornerRadius = 20
        mainView.backgroundColor = .white
    }
    
    private func setImageView() {
        mainView.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(80)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
        
        imageView.contentMode = .scaleToFill
        imageTypeSelector == .error ? (imageView.image = #imageLiteral(resourceName: "alert") ): (imageView.image = #imageLiteral(resourceName: "success"))
        
    }
    
    private func setTitle() {
        mainView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(70)
        }
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.numberOfLines = 0
    }
    
    private func setMessage() {
        mainView.addSubview(messagelabel)
        
        messagelabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        messagelabel.textAlignment = .center
        messagelabel.font = UIFont.systemFont(ofSize: 15)
        messagelabel.numberOfLines = 0
    }
    
    private func setOkButton() {
        mainView.addSubview(okButton)
        
        okButton.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(messagelabel.snp.bottom).offset(20)
            make.height.equalTo(40)
            
            okButton.setTitle("Quit", for: .normal)
            okButton.setTitleColor(UIColor.white, for: .normal)
            okButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
            okButton.titleLabel?.minimumScaleFactor = 0.7
            okButton.backgroundColor = .gray
            okButton.cornerRadius = 20
            
            if internetConnectionButtonSelector == .nonInternetAlert {
                make.bottom.equalToSuperview().inset(20)
                okButton.setTitle("OK", for: .normal)
            }
            okButton.addTarget(self, action: #selector(okButtonAction), for: .touchUpInside)
        }
    }
    
    private func setRetryButton() {
        if internetConnectionButtonSelector == .isInternetAlert {
            retryButton = UIButton(type: .system)
            mainView.addSubview(retryButton!)
            
            retryButton!.snp.makeConstraints { (make) in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().inset(20)
                make.top.equalTo(okButton.snp.bottom).offset(20)
                make.bottom.equalToSuperview().inset(20)
                make.height.equalTo(40)
            }
            retryButton!.setTitle("Retry", for: .normal)
            retryButton!.setTitleColor(.white, for: .normal)
            retryButton!.titleLabel?.font = .boldSystemFont(ofSize: 15)
            retryButton?.cornerRadius = 20
            retryButton!.backgroundColor = .gray
            retryButton!.addTarget(self, action: #selector(retryButtonAction), for: .touchUpInside)
        }
    }
    
    //MARK: - Actions
    
    private func dismissAnimation() {
        
        UIView.animate(withDuration: 0.5) {
            self.mainView.alpha = 0
            self.view.backgroundColor = UIColor(displayP3Red: 9/255, green: 18/255, blue: 17/255, alpha: 0.0)
            self.view.layoutIfNeeded()
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    private func dismissAnimationCheck() {
        
        UIView.animate(withDuration: 0.5) {
            self.mainView.alpha = 0
            self.view.backgroundColor = UIColor(displayP3Red: 9/255, green: 18/255, blue: 17/255, alpha: 0.0)
            self.view.layoutIfNeeded()
        } completion: { (_) in
            self.dismiss(animated: true, completion: nil)
            AppManager.shared.checkInternetStatus()
        }

    }
    
    @objc private func okButtonAction() {
        if internetConnectionButtonSelector == .nonInternetAlert {
           dismissAnimation()
        } else {
            exit(0)
        }
    }
    
    @objc  private func retryButtonAction() {
        if AppManager.shared.reachability.connection == .unavailable {
            dismissAnimationCheck()
        } else {
            dismissAnimation()
        }
    }
    
}

enum ImageType {
    case success
    case error
}

enum InternetAlert {
    case isInternetAlert
    case nonInternetAlert
}
