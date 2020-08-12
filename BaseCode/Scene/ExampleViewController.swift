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
        label.text = "murat gelin damindan atlayamadim murat gelin damindan atlayamadim ben o guzel ferhan yare hoplayamadim"
        label.underlineMyText(rangeArray: ["gelin","ben", "hoplayamadim"], underlinedFont: UIFont.worksansSemiBold(fontSize: 17), underlinedColor: .red)
        label.lineBreakMode = .byWordWrapping
        label.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tappedOnLabel(_:)))
        tapGesture.numberOfTouchesRequired = 1
        label.addGestureRecognizer(tapGesture)
        
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
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "asd"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.addTarget(self, action: #selector(sidebarButtonPressed), for: .touchUpInside)
        button.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.masksToBounds = false
        button.layer.borderColor = UIColor.orange.cgColor
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        leftBarButton.customView = button
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc func sidebarButtonPressed() {
        let sidebar = Sidebar()
        sidebar.showAnimation()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        LoadingView.show()
    }
    
    @objc func tappedOnLabel(_ gesture: UITapGestureRecognizer) {
        guard let text = label.text else { return }
        let ferhan = (text as NSString).range(of: "ferhan")
        if gesture.didTapAttributedTextInLabel(label: self.label, inRange: ferhan) {
            print("ferhan")
        }
    }
}
