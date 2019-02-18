//
//  graphCell.swift
//  trackingWaste
//
//  Created by Eva Philips on 2/17/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class graphCell: UITableViewCell {
    
    // graph label
    @IBOutlet weak var graphLabel: UILabel!
    
    // number label
    @IBOutlet weak var numLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
