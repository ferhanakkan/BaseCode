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
        
        let testObject = RealmExampleModel(value: ["age":1 , "name":"Name"])
        testObject.age = 10
        testObject.name = "Fero"
        let testSubObject = TestObject(value: ["name": "FerhanSub", "surname": "AkkanSub"])
        testObject.obje.append(testSubObject)

        let realm = try! Realm()
        
        let realmObject = CoreRealm()
        
        realmObject.deleteSelectedTypeTable(selectedType: RealmExampleModel.self)
        
        //read object from selected Types table
        let persons = realm.objects(RealmExampleModel.self)
        for data in persons {
            print(data)
        }
        
//        realmObject.deleteSelectedTypeTable(selectedType: RealmExampleModel.self)


//        let data = "{\"name\": \"San Francisco\", \"cityId\": 123}".data(using: .utf8)!
//        let realm = try! Realm()
//
//        // Insert from Data containing JSON
//        try! realm.write {
//            let json = try! JSONSerialization.jsonObject(with: data, options: [])
//            realm.create(City.self, value: json, update: .modified)
//        }
        
//        // Loop through the first 5 Dog objects
//        // restricting the number of objects read from disk
//        let dogs = try! Realm().objects(Dog.self)
//        for i in 0..<5 {
//            let dog = dogs[i]
//            // ...
//        }
        
        

        
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
