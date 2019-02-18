//
//  dataCell.swift
//  trackingWaste
//
//  Created by Eva Philips on 2/17/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class dataCell: UITableViewCell {
    
    // outlet of the waste label
    @IBOutlet weak var wasteLabel: UILabel!
    
    // outlet of date/time label
    @IBOutlet weak var dayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
