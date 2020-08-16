//
//  RealmExampleModel.swift
//  BaseCode
//
//  Created by Ferhan Akkan on 16.08.2020.
//
import RealmSwift

class RealmExampleModel: Object {
    @objc dynamic var name: String?
    @objc dynamic var age: Int = 0
    let obje = List<TestObject>()
}

class TestObject: Object {
    @objc dynamic var name: String = "testName"
    @objc dynamic var surname: String = "testSurname"
}
