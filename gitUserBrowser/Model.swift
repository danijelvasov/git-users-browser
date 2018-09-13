//
//  Model.swift
//  gitUserBrowser
//
//  Created by Danijel Vasov on 9/12/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit


class User {
    
    static var user = User()
    
    var name : String = ""
    var  location : String = ""
    var available : Bool? = nil
    var numberOfRepos : Int = 0
    
  func updateUser(name : String, location: String,  available: Bool?, numberOfRepos : Int) {
        self.name = name
        self.location = location
        self.available = available
        self.numberOfRepos = numberOfRepos
    }
    
}
