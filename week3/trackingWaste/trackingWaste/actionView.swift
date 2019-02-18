//
//  actionView.swift
//  trackingWaste
//
//  Created by Eva Philips on 2/17/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class actionView: UIViewController {
    
    // Callback method to be defined in parent view controller.
    var didSaveElement: ((_ element: Waste) -> ())?
    
    // trash toggle
    @IBOutlet weak var trashToggle: UISwitch!
    // trash label
    @IBOutlet weak var trashLabel: UILabel!
    
    // plastic recycling toggle
    @IBOutlet weak var plToggle: UISwitch!
    // plastic recycling label
    @IBOutlet weak var plLabel: UILabel!
    
    // paper recycling toggle
    @IBOutlet weak var paToggle: UISwitch!
    // paper recycling label
    @IBOutlet weak var paLabel: UILabel!
    
    // compost toggle
    @IBOutlet weak var cToggle: UISwitch!
    // compost label
    @IBOutlet weak var cLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.\
        print("the second view did load")
        
        
    }
    
    // when clear button is pressed
    @IBAction func clearButton(_ sender: UIButton) {
        // hide the action view
        self.dismiss(animated: true, completion: nil)
    }
    
    // when save button is pressed
    @IBAction func saveButton(_ sender: UIButton) {
        
        // get current date/time
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let str = formatter.string(from: Date())
        let dateString = str
        
        // set names
        let trashName = "Trash"
        let plName = "Plastic"
        let paName = "Paper"
        let cName = "Compost"
        
    
        
        
        // pass data back to table
        let element = Waste(date: dateString, trashName: trashName, trashToggle: trashToggle.isOn, plName: plName, plToggle: plToggle.isOn, paName: paName, paToggle: paToggle.isOn, cName: cName, cToggle: cToggle.isOn)
        didSaveElement?(element)
        
        // hide the action view
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
