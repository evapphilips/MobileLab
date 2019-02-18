//
//  graphView.swift
//  trackingWaste
//
//  Created by Eva Philips on 2/17/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit

private let elementArrayKey = "ELEMENT_ARRAY_KEY"

// Data element for table row
struct Graph: Codable {
    var trashNum: Int
    var plNum: Int
    var paNum: Int
    var cNum: Int
}



class graphView: UITableViewController {
    
    // Data array for the table.
    var elementArray = [Graph]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the height so all four sections are on the screen
        tableView.rowHeight = 150;
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "graphCell", for: indexPath) as! graphCell

        // Configure the cell...
        
        // trash section
        if (indexPath.row == 0){
            cell.graphLabel.text = "Trash"
            cell.backgroundColor =  UIColor(red:0.52, green:0.74, blue:0.75, alpha:1.0)
            
        }
        
        
        // plastic section
        if (indexPath.row == 1){
            cell.graphLabel.text = "Plastic"
            cell.backgroundColor = UIColor(red:0.97, green:0.77, blue:0.62, alpha:1.0)
        }
        
        // paper section
        if (indexPath.row == 2){
            cell.graphLabel.text = "Paper"
            cell.backgroundColor = UIColor(red:1.00, green:0.49, blue:0.43, alpha:1.0)
        }
        
        // Compost section
        if (indexPath.row == 3){
            cell.graphLabel.text = "Compost"
            cell.backgroundColor = UIColor(red:0.88, green:0.95, blue:0.91, alpha:1.0)
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
