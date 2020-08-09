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
    
    func postData() -> Promise<TestModelPost> {
        let test: [String:Any] = ["userId": 1,
                                  "title": "ferhan",
                                  "body": "test"]
        return service.post(url: "/posts", parameters: test)
    }
    
}

struct TestModelPost: Codable {
    var id: Int?
    var title: String?
    var body: String?
    var userId: String?
}


struct TestModel: Decodable {
    var postId:Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}
