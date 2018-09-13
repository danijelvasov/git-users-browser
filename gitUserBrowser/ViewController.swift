//
//  ViewController.swift
//  gitUserBrowser
//
//  Created by Danijel Vasov on 9/12/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit
import  Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var availableLbl: UILabel!
    @IBOutlet weak var reposNumLbl: UILabel!
    @IBOutlet weak var userTxtField: UITextField!
    
    let baseURL = "https://api.github.com/users/"
    var userInstance = User.user
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func getBtnPressed(_ sender: Any) {
        userTxtField.resignFirstResponder()
        let username = userTxtField.text
            if username == nil || username == "" {
                return
            } else {
        let finalURL = baseURL + username!
        getInfo(url: finalURL)
        }
    }
    
    func getInfo(url: String) {
        Alamofire.request(url , method: .get).responseJSON { response in
            
            if response.result.isSuccess {
                let userJSON : JSON = JSON(response.result.value!)
                self.updateUserInfo(json: userJSON)
                
            } else {
                self.nameLbl.text = "No response"
            }
        }
    }
   
    func updateUserInfo(json: JSON) {
        let nameResult = json ["name"].stringValue
        let locationResult = json ["location"].stringValue
        let availableResult = json ["hireable"].bool
        let reposResult = json ["public_repos"].intValue
        
       userInstance.updateUser(name: nameResult, location: locationResult, available: availableResult, numberOfRepos: reposResult)
        
        updateUI(name: userInstance.name, location: userInstance.location, available: userInstance.available, repos: userInstance.numberOfRepos)
    }
    
    
    func updateUI(name: String, location: String, available: Bool?, repos: Int) {
        nameLbl.text = name
        locationLbl.text = location
        if available == true {
            availableLbl.text = "Yes."
        } else if available == false {
            availableLbl.text = "No."
        } else if available == nil {
            availableLbl.text = " - "
        }
        reposNumLbl.text = String(repos)
    }
    
    
}

