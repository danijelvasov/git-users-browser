//
//  SavedUsersTableVC.swift
//  gitUserBrowser
//
//  Created by Danijel Vasov on 9/14/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit
import RealmSwift

class SavedUsersTableVC: UITableViewController {

    
 
    
    
    var usersArray : Results<RealmUser>?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.reloadData()
        let realm = RealmSevice.sharedInstance.realm
        usersArray = realm.objects(RealmUser.self)
     
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return usersArray?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SavedUserCell else {
            return UITableViewCell()}
        
        let realmUsersToShow = usersArray?[indexPath.row]
        cell.configureCell(with: realmUsersToShow!)

        return cell
    }
  
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let objectToDelete = usersArray?[indexPath.row]
        RealmSevice.sharedInstance.delete(object: objectToDelete!)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }



}
