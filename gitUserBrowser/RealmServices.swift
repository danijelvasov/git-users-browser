//
//  RealmServices.swift
//  gitUserBrowser
//
//  Created by Danijel Vasov on 9/14/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit
import RealmSwift



class RealmSevice {
   
    private init() {}
    static let sharedInstance = RealmSevice()
    var message = ""
    
    var realm = try! Realm()
    
    func save <T: Object>(object:  T) {
        do {
            try realm.write {
                realm.add(object)
                message = "Saved"
            }
        } catch {
            post(error)
        }
    }
    
    
    func delete <T : Object> (object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            post(error)
        }
    }
    
    
    func post(_ error: Error) {
        NotificationCenter.default.post(name: NSNotification.Name("Error"), object: error)
    }
    
    
}
