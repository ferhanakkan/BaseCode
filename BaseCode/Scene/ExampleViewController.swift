//
//  ExampleViewController.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 6.08.2020.
//

import UIKit
import PromiseKit
import SnapKit
import Kingfisher


class ExampleViewController: UIViewController {
    
    let service = ExampleService()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
        label.numberOfLines = 0
        
//        UserDefaults.setLanguage(language: .turkish)
        label.text = "language".localized()
        
        
        self.view.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
//        service.getData().done { (response) in
//            print("ferhan sonuc \(response[0])")
//        }.catch { (err) in
//            print("error test")
//        }
        
        service.postData().done { (res) in
            print("post resfer \(res)")
        }.catch { (err) in
            print("post resfer catch \(err)")
        }
        
//        firstly {
//            service.getData()
//        }.then { [unowned self] res in
//            self.service.postData()
//        }.done { (test) in
//            print(test)
//        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let leftBarButton = UIBarButtonItem()
        let button = UIButton().createBarButton(backgroundImageName: "Profile", size: 30, cornerRadius: 15, borderWidth: 2, borderColor: .orange)
        button.addTarget(self, action: #selector(sidebarButtonPressed), for: .touchUpInside)
        leftBarButton.customView = button
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func sidebarButtonPressed() {
        let sidebar = Sidebar()
        sidebar.showAnimation()
    }
}
