//
//  ExampleService.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 6.08.2020.
//

import PromiseKit

class ExampleService {
    
    let service = CoreService()
    
    func getData() -> Promise<[TestModel]> {
        service.get(url: "/comments", parameters: ["postId": 1])
    }
    
}


struct TestModel: Decodable {
    var postId:Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}
