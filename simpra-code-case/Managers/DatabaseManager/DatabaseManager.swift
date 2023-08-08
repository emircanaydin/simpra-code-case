//
//  DatabaseManager.swift
//  simpra-code-case
//
//  Created by Emircan Aydın on 8.08.2023.
//

import Foundation
import RealmSwift

class DatabaseManager {
    let shared = DatabaseManager()
    private let realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch let error {
            fatalError("Error initializing Realm: \(error.localizedDescription)")
        }
    }
    
    func addObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch let error {
            print("Error adding object to Realm: \(error.localizedDescription)")
        }
    }
    
    func addObjects<T: Object>(_ objects: [T]) {
        do {
            try realm.write {
                realm.add(objects)
            }
        } catch let error {
            print("Error adding objects to Realm: \(error.localizedDescription)")
        }
    }

    func deleteObject<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch let error {
            print("Error deleting object from Realm: \(error.localizedDescription)")
        }
    }
    
    func getAllObjects<T: Object>(_ type: T.Type) -> Results<T> {
        return realm.objects(type)
    }
}
