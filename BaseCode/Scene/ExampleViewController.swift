//
//  ExampleViewController.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 6.08.2020.
//

import UIKit
import PromiseKit

class ExampleViewController: UIViewController {
    
    let service = ExampleService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
        
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
}
