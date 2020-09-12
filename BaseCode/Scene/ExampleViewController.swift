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
import RealmSwift


class ExampleViewController: UIViewController {
    
    let service = ExampleService()
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
//        service.getAll().done { (all) in
//            print(all)
//        }
        
//        let user = UserModelForVaporTest(name: "ferhan ios", surname: "akkanios", age: 22)
//        service.postUser(parameter: user).done { (response) in
//            print("ferhan \(response)")
//        }.catch { (err) in
//            print(err)
//        }
        
//        firstly {
//            service.getAll()
//        }.then { (response) in
//            self.service.getById(param: response[0])
//        }.done { response in
//            print(response)
//        }
//        service.getAll().done { (response) in
//            print("ferhan \(response)")
//        }.catch { (err) in
//            print(err)
//        }
        
//        firstly {
//            service.getAll()
//        }.then { (userArray) in
//            self.service.deleteById(parameter: userArray[0])
//        }.done { (response) in
//            print("ferhan \(response)")
//        }.catch { (err) in
//            print("ferhan\(err)")
//        }
//
        service.getByName(param: "akkanios").done { (res) in
            print("ferhan \(res)")
        }.catch { (err) in
            print("errfer \(err)")
        }
        
//        C41A7709-FADC-4F43-8F69-2A37A83B648A

        
//        label.numberOfLines = 0
//        label.text = "language".localized()
//
//
//        self.view.addSubview(label)
//
//        label.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//            make.leading.equalToSuperview().offset(10)
//            make.trailing.equalToSuperview().inset(10)
//        }
        
//        service.getData().done { (response) in
//            print("ferhan sonuc \(response[0])")
//        }.catch { (err) in
//            print("error test")
//        }
//
//        service.postData().done { (res) in
//            print("post resfer \(res)")
//        }.catch { (err) in
//            print("post resfer catch \(err)")
//        }
        
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
        let button = UIButton().createBarButton(backgroundImageName: "Profile", size: 40, cornerRadius: 20, borderWidth: 2, borderColor: .orange)
        button.addTarget(self, action: #selector(sidebarButtonPressed), for: .touchUpInside)
        leftBarButton.customView = button
        navigationItem.leftBarButtonItem = leftBarButton
        
//        let titleView = UIView()
//        let label = UILabel()
//        let imageView = UIImageView(image: UIImage(named: "Profile"))
//
//        titleView.backgroundColor = .red
//        titleView.addSubview(label)
//        titleView.addSubview(imageView)
//
//        label.center = titleView.center
//        label.textAlignment = .center
//        label.text = "asdasdasdasdasdasdasd"
//        label.font = .worksansSemiBold(fontSize: 12)
//
//
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.topAnchor.constraint(equalTo: titleView.topAnchor).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
//        label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
//        label.bottomAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
//        label.leadingAnchor.constraint(equalTo: titleView.leadingAnchor).isActive = true
//        label.trailingAnchor.constraint(equalTo: titleView.trailingAnchor).isActive = true
//        navigationItem.titleView = titleView
//        titleView.widthAnchor.constraint(equalToConstant:  self.view.frame.width-20).isActive = true
//        print("ferhan frame \(titleView.frame)")
        
//        let testView = UIView()
//        testView.translatesAutoresizingMaskIntoConstraints = false
//        testView.backgroundColor = .red
//        let textView = UITextField()
//        testView.addSubview(textView)
//        textView.placeholder = "test"
//        textView.translatesAutoresizingMaskIntoConstraints = false
//        textView.topAnchor.constraint(equalTo: testView.topAnchor).isActive = true
//        textView.bottomAnchor.constraint(equalTo: testView.bottomAnchor).isActive = true
//        textView.leadingAnchor.constraint(equalTo: testView.leadingAnchor).isActive = true
//        textView.trailingAnchor.constraint(equalTo: testView.trailingAnchor).isActive = true
//        textView.widthAnchor.constraint(equalToConstant: 250).isActive = true
//        textView.backgroundColor = .white
//
//        navigationItem.titleView = testView
        
//        let vieww = UIView()
//        vieww.translatesAutoresizingMaskIntoConstraints = false
//        vieww.backgroundColor = .red
//        navigationItem.titleView = vieww
        
        
    }
    
    @objc func sidebarButtonPressed() {
        let sidebar = Sidebar()
        sidebar.showAnimation()
    }
}
