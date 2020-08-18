//
//  ExampleService.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 6.08.2020.
//

import PromiseKit

class ExampleService {
    
    let service = CoreService()
    
//    func getData() -> Promise<[TestModel]> {
//        service.get(url: "/comments", parameters: ["postId": 1])
//    }
//
//    func postData() -> Promise<TestModelPost> {
//        let test: [String:Any] = ["userId": 1,
//                                  "title": "ferhan",
//                                  "body": "test"]
//        return service.post(url: "/posts", parameters: test)
//    }
    
    func postUser(parameter: UserModelForVaporTest) -> Promise<UserModelForVaporTest> {
        let param = parameter.dictionary
        return service.post(url: "user", parameters: param)
    }
    
    func getAll() -> Promise<[UserModelForVaporTest]> {
        return service.get(url: "user")
    }
    
    func deleteById(parameter: UserModelForVaporTest) -> Promise<UserModelForVaporTest> {
        return service.delete(url: "user/\(parameter.id!)")
    }
    
    func getById(param: UserModelForVaporTest) -> Promise<[UserModelForVaporTest]> {
        return service.get(url: "user/\(param.id!)")
    }
    
    func getByName(param: String) -> Promise<UserModelForVaporTest> {
        let parameter = ["name": param]
        return service.get(url: "user/nameFilter", parameters: parameter)
    }
    
//    func getById() -> Promise<UserModelForVaporTest> {
//
//    }
    
}

//// Encode
//let dog = Dog(name: "Rex", owner: "Etgar")
//
//let jsonEncoder = JSONEncoder()
//let jsonData = try jsonEncoder.encode(dog)
//let json = String(data: jsonData, encoding: String.Encoding.utf16)
//
//// Decode
//let jsonDecoder = JSONDecoder()
//let secondDog = try jsonDecoder.decode(Dog.self, from: jsonData)

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
