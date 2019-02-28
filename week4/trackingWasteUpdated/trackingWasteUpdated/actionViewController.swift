//
//  actionViewController.swift
//  trackingWasteUpdated
//
//  Created by Eva Philips on 2/24/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

class actionViewController: UIViewController {
    
    // Callback method to be defined in parent view controller.
    var didSaveElement: ((_ element: Waste) -> ())?
    
    // action panel elements
    // define action panel view
    var actionPanel: UIView!
    // action panel view animation duration
    let duration: Double = 0.5;
    // cancel, save, and log label margin
    let buttonMargin: CGFloat = CGFloat(20);
    // define cancel button
    var cancelButton: UIButton!
    // define button size
    let buttonSize: CGSize = CGSize(width: 60, height: 20)
    // define save button
    var saveButton: UIButton!
    // define log label
    var logLabel: UILabel!
    // define label size
    let logLabelSize: CGSize = CGSize(width: 125, height: 20)
    // toggle label size
    let toggleLabelSize: CGSize = CGSize(width: 150, height: 20)
    // define trash label
    var trashLabel: UILabel!
    // toggle switch size
    let toggleSize: CGSize = CGSize(width: 20, height: 20)
    // trash toggle
    var trashToggle: UISwitch!
    // define plastic label
    var plasticLabel: UILabel!
    // plastic toggle
    var plasticToggle: UISwitch!
    // define paper label
    var paperLabel: UILabel!
    // paper toggle
    var paperToggle: UISwitch!
    // define compost label
    var compostLabel: UILabel!
    // compost toggle
    var compostToggle: UISwitch!
    
    // data info
    // save data element states
    var trashToggleState: Bool!
    var plasticToggleState: Bool!
    var paperToggleState: Bool!
    var compostToggleState: Bool!
//    // save number of times of each waste item
//    var trashNumber: CGFloat! = 0;
//    var plasticNumber: CGFloat! = 0;
//    var paperNumber: CGFloat! = 0;
//    var compostNumber: CGFloat! = 0;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // made the background of the action view transparent
        view.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        
        // set up action view
        // initilize action view parameters
        actionPanel = UIView(frame: CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height/2))
        actionPanel.backgroundColor = UIColor(red:0.00, green:0.43, blue:0.38, alpha:1.0)
        actionPanel.layer.cornerRadius = 15;
        // add to main view controller
        self.view.addSubview(actionPanel)
        
        // toggle  spacing
        let toggleSpacing: CGFloat = CGFloat(actionPanel.frame.height/6)
        
        // set up cancel button
        cancelButton = UIButton(frame: CGRect(origin: CGPoint(x: buttonMargin, y: buttonMargin), size: buttonSize))
        cancelButton.setTitle("cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(actionViewController.cancelButtonAction(_:)), for: .touchUpInside)
        // add to action panel view
        actionPanel.addSubview(cancelButton)

        // setup save button
        saveButton = UIButton(frame: CGRect(origin: CGPoint(x: actionPanel.frame.width - buttonSize.width - buttonMargin, y: buttonMargin), size: buttonSize))
        saveButton.setTitle("save", for: .normal)
        saveButton.addTarget(self, action: #selector(actionViewController.saveButtonAction(_:)), for: .touchUpInside)
        // add to action panel view
        actionPanel.addSubview(saveButton)

        // setup log label
        logLabel = UILabel(frame: CGRect(origin: CGPoint(x: actionPanel.frame.width/2 - logLabelSize.width/2, y: buttonMargin), size: logLabelSize))
        logLabel.text = "Log your waste"
        // add to action panel view
        actionPanel.addSubview(logLabel)

        // setup trash label
        trashLabel = UILabel(frame: CGRect(origin: CGPoint(x: toggleSpacing, y: toggleSpacing + buttonMargin + toggleLabelSize.height), size: toggleLabelSize))
        trashLabel.text = "Trash"
        // add to action panel view
        actionPanel.addSubview(trashLabel)

        // setup trash toggle
        trashToggle = UISwitch(frame: CGRect(origin: CGPoint(x: actionPanel.frame.width - toggleSpacing - (2*toggleSize.width), y: (toggleSpacing) + buttonMargin + toggleSize.height), size: toggleSize))
        // add to action panel view
        actionPanel.addSubview(trashToggle)
        
        // setup plastic label
        plasticLabel = UILabel(frame: CGRect(origin: CGPoint(x: toggleSpacing, y: (2*toggleSpacing) + buttonMargin + toggleLabelSize.height), size: toggleLabelSize))
        plasticLabel.text = "Plastic"
        // add to action panel view
        actionPanel.addSubview(plasticLabel)
        
        // setup plastic toggle
        plasticToggle = UISwitch(frame: CGRect(origin: CGPoint(x: actionPanel.frame.width - (toggleSpacing) - (2*toggleSize.width), y: (2*toggleSpacing) + buttonMargin + toggleSize.height), size: toggleSize))
        // add to action panel view
        actionPanel.addSubview(plasticToggle)
        
        // setup paper label
        paperLabel = UILabel(frame: CGRect(origin: CGPoint(x: toggleSpacing, y: (3*toggleSpacing) + buttonMargin + toggleLabelSize.height), size: toggleLabelSize))
        paperLabel.text = "Paper"
        // add to action panel view
        actionPanel.addSubview(paperLabel)
        
        // setup paper toggle
        paperToggle = UISwitch(frame: CGRect(origin: CGPoint(x: actionPanel.frame.width - (toggleSpacing) - (2*toggleSize.width), y: (3*toggleSpacing) + buttonMargin + toggleSize.height), size: toggleSize))
        // add to action panel view
        actionPanel.addSubview(paperToggle)
        
        // setup compost label
        compostLabel = UILabel(frame: CGRect(origin: CGPoint(x: toggleSpacing, y: (4*toggleSpacing) + buttonMargin + toggleLabelSize.height), size: toggleLabelSize))
        compostLabel.text = "Compost"
        // add to action panel view
        actionPanel.addSubview(compostLabel)
        
        // setup compost toggle
        compostToggle = UISwitch(frame: CGRect(origin: CGPoint(x: actionPanel.frame.width - (toggleSpacing) - (2*toggleSize.width), y: (4*toggleSpacing) + buttonMargin + toggleSize.height), size: toggleSize))
        // add to action panel view
        actionPanel.addSubview(compostToggle)
        
    }
    
    // after action view appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // start elements outside of the frame
        self.actionPanel.center = CGPoint(x: self.view.frame.width/2, y: 5*self.view.frame.height/4)
        // slide up and animate into place
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [.curveEaseIn],
            animations: {
                // animate to inside the frame
                self.actionPanel.center = CGPoint(x: self.view.frame.width/2, y: 3*self.view.frame.height/4)
        })
    }
    
    // when the cancel button is pressed
    @objc func cancelButtonAction(_ sender: UIButton) {
        // slide down and animate to remove from view
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [.curveEaseOut],
            animations: {
                // animate elements outside the frame
                self.actionPanel.center = CGPoint(x: self.view.frame.width/2, y: 5*self.view.frame.height/4)
                
        }, completion: { finished in
            // dismiss the actionView when animation is done
            self.dismiss(animated: false, completion: nil)
        })
    }
    
    // when the save button is pressed
    @objc func saveButtonAction(_ sender: UIButton) {
        
        // save the states of each toggle
        trashToggleState = trashToggle.isOn
        plasticToggleState = plasticToggle.isOn
        paperToggleState = paperToggle.isOn
        compostToggleState = compostToggle.isOn
        
//        // add to waste number when toggle is one
//        if(trashToggleState){
//            trashNumber += 1
//        }
//        if(plasticToggleState){
//            plasticNumber += 1
//        }
//        if(paperToggleState){
//            paperNumber += 1
//        }
//        if(compostToggleState){
//            compostNumber += 1
//        }
        
        
        // pass data back to table
//        let element = Waste(trashNumber: trashNumber, plasticNumber: plasticNumber, paperNumber: paperNumber, compostNumber: compostNumber)
        let element = Waste(trashToggleState: trashToggleState, plasticToggleState: plasticToggleState, paperToggleState: paperToggleState, compostToggleState: compostToggleState)
        //print(element)
        didSaveElement?(element)
        
        // dismiss the actionView when animation is done
        // slide down and animate to remove from view
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [.curveEaseOut],
            animations: {
                // animate elements outside the frame
                self.actionPanel.center = CGPoint(x: self.view.frame.width/2, y: 5*self.view.frame.height/4)
                
        }, completion: { finished in
            // dismiss the actionView when animation is done
            self.dismiss(animated: false, completion: nil)
        })
        
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
