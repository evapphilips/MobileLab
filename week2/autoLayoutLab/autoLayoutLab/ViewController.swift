//
//  ViewController.swift
//  autoLayoutLab
//
//  Created by Eva Philips on 2/9/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handleButton1(_ sender: UIButton) {
        theLabel.text = "Giraffe"
        coverImageView.image = UIImage(named:"giraffe.jpg")
    }
    
    @IBAction func handleButton2(_ sender: UIButton) {
        theLabel.text = "Elephant"
        coverImageView.image = UIImage(named:"elephant.jpg")
    }
    
    
    @IBAction func handleButton3(_ sender: UIButton) {
        theLabel.text = "Monkey"
        coverImageView.image = UIImage(named:"monkey.jpg")
    }
}

