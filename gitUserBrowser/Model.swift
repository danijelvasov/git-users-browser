//
//  Model.swift
//  gitUserBrowser
//
//  Created by Danijel Vasov on 9/12/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit
import RealmSwift

class User {
    
    static var user = User()
    
    var name : String = ""
    var  location : String = ""
    var available : Bool? = false
    var numberOfRepos : Int = 0
    
  func updateUser(name : String, location: String,  available: Bool?, numberOfRepos : Int) {
        self.name = name
        self.location = location
        self.available = available
        self.numberOfRepos = numberOfRepos
    }
    
}


class RealmUser: Object {
    
    @objc dynamic var name: String? = ""
    @objc dynamic var location : String? = ""
    var available = RealmOptional<Bool>()
    var numberOfRepos = RealmOptional<Int>()
    
   convenience init (name: String?, location: String?, available: Bool?, numberOfRepos: Int?) {
        self.init()
        self.name = name
        self.location = location
        self.available.value = available
        self.numberOfRepos.value = numberOfRepos
    }
    
    func availableAsString() -> String {
       var result = ""
        if available.value == true {
            result = "Yes"
        } else if available.value == false {
            result = "No"
        } else if available.value == nil {
           result = "N/A"
        }
        return result
    }
    
    func reposAsString() -> String {
        var result = ""
        if numberOfRepos.value != nil {
            result = String(numberOfRepos.value!)
        }
        return result
    }
    
    
    
}

