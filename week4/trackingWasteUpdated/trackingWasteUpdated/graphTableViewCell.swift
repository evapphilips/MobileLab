//
//  graphTableViewCell.swift
//  trackingWasteUpdated
//
//  Created by Eva Philips on 2/23/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class graphTableViewCell: UITableViewCell {
    
    // graph cell variables
    
    // UIView (graph bar) to show in cell
    var barView: UIView!
    // graph bar custom color
    let purpleColor = UIColor(red:0.59, green:0.24, blue:0.59, alpha:1.0)
    // Proportion value for bar width size.
    let sizeProportion: CGFloat = 0.11
    // Animation duration.
    let duration: Double = 1.0
    
    // UILabel (graph bar label) to show in cell
    var barLabel: UILabel!
    
    // header label
    var headerLabel: UILabel!
    

    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // set cell background color
        backgroundColor = UIColor(red:1.00, green:0.77, blue:0.71, alpha:1.0);
        
        // set up scaled bar view
        // Make bar size a percentage of the overall cell width.
        let barSize = self.frame.width * sizeProportion
        // create graph bar view
        barView = UIView(frame: CGRect(x: 0, y: 0, width: barSize, height: (self.frame.height)))
        // add to parent view
        self.addSubview(barView)
        
        // set up bar label
        // create graph bar label
        barLabel = UILabel(frame: CGRect(x: 10, y: -(self.frame.height)+(self.frame.height/2), width: self.frame.width, height: (2*self.frame.height)-(self.frame.height/10)))
        // set graph bar label settings
        barLabel.textAlignment = .left
        barLabel.font = barLabel.font.withSize(40)
        //barLabel.text = "+"
        // Add to parent view
        self.addSubview(barLabel)
        
        // set up title label
        headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        headerLabel.center = CGPoint(x: self.frame.width/2, y: self.frame.height/4)
        headerLabel.textAlignment = .center
        headerLabel.font = headerLabel.font.withSize(20)
        self.addSubview(headerLabel)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func animateBar(total: CGFloat){
                    UIView.animate(
                        withDuration: duration,
                        delay: 0,
                        options: [.curveLinear],
                        animations: {
                            // scale
                            self.barView.transform = CGAffineTransform(scaleX: CGFloat(total), y: 1)
                            // move
                            self.barView.center = CGPoint(x: (self.barView.frame.width)/2, y: (self.barView.frame.height)/2)
                            
                    })

    }

}
