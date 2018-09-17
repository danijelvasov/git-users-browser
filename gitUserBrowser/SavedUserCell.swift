//
//  SavedUserCell.swift
//  gitUserBrowser
//
//  Created by Danijel Vasov on 9/14/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit
import RealmSwift

class SavedUserCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var availableLbl: UILabel!
    @IBOutlet weak var reposLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



    func configureCell(with realmUser : RealmUser) {
        self.nameLbl.text = realmUser.name
        self.locationLbl.text = realmUser.location
        self.availableLbl.text = realmUser.availableAsString()
        self.reposLbl.text = realmUser.reposAsString()
    }
    
    
}
