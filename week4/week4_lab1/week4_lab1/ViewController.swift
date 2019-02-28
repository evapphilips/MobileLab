//
//  ViewController.swift
//  week4_lab1
//
//  Created by Eva Philips on 2/23/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func animateButtonPressed(_ sender: Any) {
    
        // set size to be a random number between 20.0 and 60.0
        let size : CGFloat = CGFloat( arc4random_uniform(40))+20
        
        // set yPosition to be a random number between 20.0 and 220.0
        let yPosition : CGFloat = CGFloat( arc4random_uniform(200))+20
        
        // create the square using these constants
        // in this example I've also used the Objective-C convention for making the CGRect
        // but I could have used CGRect(x:0, y:yPosition, width:size, height:size) like we've done previously - they are equivalent
        let coloredSquare = UIView()
        coloredSquare.backgroundColor = UIColor.blue
        coloredSquare.frame = CGRect(x:0, y:yPosition, width:size, height:size)
        self.view.addSubview(coloredSquare)
        
        // set up some constants for the animation
        let duration = 1.0
        let delay = 0.0
        let options = UIView.AnimationOptions.curveLinear
        
        // define the animation
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            
            coloredSquare.backgroundColor = UIColor.red
            
            // again use the square constants size and yPosition
            coloredSquare.frame = CGRect(x: 420-size, y: yPosition, width: size, height: size)
            
        }, completion: { animationFinished in
            
            coloredSquare.removeFromSuperview()
            
        })
    }
    


}

