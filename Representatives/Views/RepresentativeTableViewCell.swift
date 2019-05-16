//
//  RepresentativeTableViewCell.swift
//  Representatives
//
//  Created by Jordan Hendrickson on 5/16/19.
//  Copyright © 2019 Jordan Hendrickson. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {
    
    var representative: Representative? {
        didSet {
          updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    func updateViews() {
        self.nameLabel.text = representative?.name
        self.partyLabel.text = representative?.party
        self.districtLabel.text = representative?.district
        self.websiteLabel.text = representative?.link
        self.phoneLabel.text = representative?.phone
    }
}
