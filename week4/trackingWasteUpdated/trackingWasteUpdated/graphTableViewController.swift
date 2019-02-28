//
//  graphTableViewController.swift
//  trackingWasteUpdated
//
//  Created by Eva Philips on 2/23/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

//private let elementArrayKey = "ELEMENT_ARRAY_KEY"
private let wasteTotalKey = "WASTE_KEY"

// Data element for table row.
//struct Waste: Codable {
//    var trashNumber: CGFloat
//    var plasticNumber: CGFloat
//    var paperNumber: CGFloat
//    var compostNumber: CGFloat
//}
struct Waste: Codable {
    var trashToggleState: Bool
    var plasticToggleState: Bool
    var paperToggleState: Bool
    var compostToggleState: Bool
}

struct WasteTotal: Codable {
    var trash: CGFloat
    var plastic: CGFloat
    var paper: CGFloat
    var compost: CGFloat
}

class graphTableViewController: UITableViewController {
    
    // data from action view
    // Data array for the table.
    //var elementArray = [Waste]()
//    var toggleData = [Bool](arrayLiteral: false,false,false,false)
    // define wate numbers
    
    // table view setup
    // waste number array [trash, plastic, paper, compost]
    var waste = ["", "Trash", "Plastic", "Paper", "Compost"]
    var barColor = UIColor(red:1.00, green:0.57, blue:0.46, alpha:1.0)
    var samples = [1, 3, 6, 4]
    
    var myWasteTotal: WasteTotal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //        // Get Data from user defaults and set data array.
        if let data = UserDefaults.standard.value(forKey: wasteTotalKey) as? Data {
            self.myWasteTotal = try? PropertyListDecoder().decode(WasteTotal.self, from: data)
            self.tableView.reloadData()
        } else {
            self.myWasteTotal = WasteTotal(trash: 0, plastic: 0, paper: 0, compost: 0)
        }
  
        
        
        // cell setup
        // set background color to view to gray
        tableView.backgroundColor = UIColor(red:1.00, green:0.77, blue:0.71, alpha:1.0)
        
        
        
        // add button setup
        // initialize add button parameters
        let buttonSize: CGFloat = 50;
        let addButton = UIButton(frame: CGRect(x: self.view.frame.width/2 - buttonSize/2, y: self.view.frame.height - (buttonSize+self.view.frame.height/12), width: buttonSize, height: buttonSize))
        addButton.titleLabel?.font = addButton.titleLabel?.font.withSize(50)
        addButton.titleLabel?.textAlignment = .center
        addButton.setTitle("+", for: UIControl.State.normal)
        addButton.layer.cornerRadius = buttonSize/2;
        // add button action
        addButton.addTarget(self, action: #selector(graphTableViewController.buttonAction(_:)), for: .touchUpInside)
        // add button to subview
        self.view.addSubview(addButton)
        
   
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
        
        
    }
    
    // when the add button is pressed
    @objc func buttonAction(_ sender: UIButton) {
        // when button is pressed, reference the action view controller and present it
        let actionView = storyboard!.instantiateViewController(withIdentifier: "actionViewController") as! actionViewController
        
        // Define callback method.
        actionView.didSaveElement = { [weak self] element in

            self?.myWasteTotal?.trash   += element.trashToggleState ? 1 : 0
            self?.myWasteTotal?.paper   += element.paperToggleState ? 1 : 0
            self?.myWasteTotal?.compost += element.compostToggleState ? 1 : 0
            self?.myWasteTotal?.plastic += element.plasticToggleState ? 1 : 0

            // Resave element array into User defaults.
//            UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.elementArray), forKey: elementArrayKey)
     
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.myWasteTotal),
                                      forKey: wasteTotalKey)

            self?.tableView.reloadData()
        }
        
        // put it over the parent view
        actionView.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.present(actionView, animated: false, completion: nil)
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphTableViewCell", for: indexPath) as! graphTableViewCell
 
        var total: CGFloat = 0
        
        // title
        if(indexPath.row == 0){
            // set cell height
            tableView.rowHeight = (self.view.frame.height-(self.view.frame.height/5))/12;
            // add title
            cell.headerLabel.text = "Your waste log"
        }
        
        // set total
        if (indexPath.row == 1) {
            total = myWasteTotal?.trash ?? 0
        } else if (indexPath.row == 2) {
            total = myWasteTotal?.plastic ?? 0
        } else if (indexPath.row == 3) {
            total = myWasteTotal?.paper ?? 0
        } else if (indexPath.row == 4) {
            total = myWasteTotal?.compost ?? 0
        }
        
        // display bars
        if(indexPath.row>0){
            // set cell height
            tableView.rowHeight = (self.view.frame.height-(self.view.frame.height/5))/4;
            // Animate the bar to scale and move so it is always alligned left
            cell.animateBar(total: total)
            
            // add label to each graph bar
            cell.barLabel.text = self.waste[indexPath.row]
            
            // add the right color to each bar
            cell.barView.backgroundColor = barColor
            
        }
        
        
        return cell
    }
    
    

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
