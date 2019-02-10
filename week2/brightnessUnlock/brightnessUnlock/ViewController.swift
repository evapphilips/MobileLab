//
//  ViewController.swift
//  brightnessUnlock
//
//  Created by Eva Philips on 2/10/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    // variables
    //var currentBrightness = (UIScreen.main.brightness)*100;
    var numberTries: Int = 0;
    
    // status label outlet
    @IBOutlet weak var statusLabel: UILabel!
    
    // percent brightness button outlet
    @IBOutlet weak var percentButton: UIButton!
    // reset button outlet
    @IBOutlet weak var resetButton: UIButton!
    // image icon
    @IBOutlet weak var iconImage: UIImageView!
    
    
    // Override setup function already provided by parent class.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // when opened reset the app
        openReset();
    }
    
    
    // percent button clicked
    @IBAction func percentButton(_ sender: UIButton) {
        print(Int((UIScreen.main.brightness)*100));
        let currentBrightness = (UIScreen.main.brightness)*100;
        
        numberTries = numberTries + 1// when clicked, increse the number of tries by one
        print(numberTries)
        
        // change status label
        if Int(currentBrightness) == 100 {
            statusLabel.text = "unlocked";
            percentButton.isHidden = true; // hide the submit button
            resetButton.isHidden = false; // show the reset button
            iconImage.image = UIImage(named: "yellowBrightnessIcon.png") // show unlocked image
        } else if numberTries > 0 && numberTries < 4 {
            statusLabel.text = "try again";
        } else if numberTries >= 4 {
            statusLabel.text = "you failed"
            percentButton.isHidden = true; // hide the submit button
            resetButton.isHidden = false; // show the reset button
        }
    }
    
    // reset button clicked
    @IBAction func resetButton(_ sender: UIButton) {
        statusLabel.text = "locked";
        numberTries = 0;
        iconImage.image = UIImage(named: "brightnessIcon.png")
        percentButton.isHidden = false;
        resetButton.isHidden = true;
    }
    
    // reset function when aplicaiton is opened
    func openReset() {
        statusLabel.text = "locked";
        numberTries = 0;
        iconImage.image = UIImage(named: "brightnessIcon.png")
        percentButton.isHidden = false;
        resetButton.isHidden = true;
    }
    
    


}

