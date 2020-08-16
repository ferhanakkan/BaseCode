//
//  CoreRealm.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 16.08.2020.
//

import RealmSwift

class CoreRealm {
    
// Usage Example:
//    let testObject = RealmExampleModel(value: ["age":1 , "name":"Name"])
//    let testSubObject = TestObject(value: ["name": "FerhanSub", "surname": "AkkanSub"])
//    testObject.obje.append(testSubObject)
    
    let realm = try! Realm()
    
    func deleteDatabase() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete<T: Object>(selectedType: T.Type) {
        try! realm.write {
            let object = realm.objects(selectedType)
            realm.delete(object)
        }
    }
    
    func delete<T: Object>(selectedType: T.Type, index: Int) {
        try! realm.write {
            let object = realm.objects(selectedType)
            realm.delete(object[index])
        }
    }
    
    func add<T: Object>(_ selectedObject: T) {
        do {
            try realm.write {
                realm.add(selectedObject)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    // return Diretly object
    func getArray<T: Object>(selectedType: T.Type) -> [T]{
        let object = realm.objects(selectedType)
        var array = [T]()
        for data in object {
            array.append(data)
        }
        return array
    }
    
    func getObject<T: Object>(selectedType: T.Type, index: Int) -> T{
        let object = realm.objects(selectedType)
        var array = [T]()
        for data in object {
            array.append(data)
        }
        return array[index]
    }
    
    // return Result tyle
    func getResults<T: Object>(selectedType: T.Type) -> Results<T> {
        return realm.objects(selectedType)
    }
    
    func getResult<T: Object>(selectedType: T.Type) -> T? {
        return realm.objects(selectedType).first
    }
    
    func createJsonToDB<T: Object>(jsonData data: Data, formatType: T.Type) {
//        let data = "{\"name\": \"San Francisco\", \"cityId\": 123}".data(using: .utf8)!
        let realm = try! Realm()
        
        try! realm.write {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                realm.create(formatType, value: json, update: .modified)
            } catch {
                print("Json parsing error line 65")
            }
        }
    }
}
