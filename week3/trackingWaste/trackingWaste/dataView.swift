//
//  dataView.swift
//  trackingWaste
//
//  Created by Eva Philips on 2/17/19.
//  Copyright © 2019 evaphilips. All rights reserved.
//

import UIKit


private let elementArrayKey = "ELEMENT_ARRAY_KEY"

// Data element for table row.
struct Waste: Codable {
    var date: String
    var trashName: String
    var trashToggle: Bool
    var plName: String
    var plToggle: Bool
    var paName: String
    var paToggle: Bool
    var cName: String
    var cToggle: Bool
    
}



class dataView: UITableViewController {
    
    // Data array for the table.
    var elementArray = [Waste]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("view did load")
        
        // Get Data from user defaults and set data array.
        if let data = UserDefaults.standard.value(forKey: elementArrayKey) as? Data {
            
            let elementArray = try? PropertyListDecoder().decode(Array<Waste>.self, from: data)
            
            self.elementArray = elementArray!
            
            self.tableView.reloadData()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let actionView = storyboard.instantiateViewController(withIdentifier: "actionView") as! actionView
        
        // Define callback method.
        actionView.didSaveElement = { [weak self] element in
            
            self?.elementArray.append(element)
            
            // Resave element array into User defaults.
            UserDefaults.standard.set(try? PropertyListEncoder().encode(self?.elementArray), forKey: elementArrayKey)
            
            self?.tableView.reloadData()
        }
        
        self.present(actionView, animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return elementArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! dataCell

        // Configure the cell...
        
        // Set every other row to E0F2E9 color
        if (indexPath.row % 2) == 0{
            cell.backgroundColor = UIColor(red:0.88, green:0.95, blue:0.91, alpha:1.0)
            
        }
        
        let element = elementArray[indexPath.row]
        
        
        // check which buttons were toggled
        var wasteArray = [String]()
        if element.trashToggle == true {
            wasteArray.append(element.trashName)
        }
        if element.plToggle == true{
            wasteArray.append(element.plName)
        }
        if element.paToggle == true{
            wasteArray.append(element.paName)
        }
        if element.cToggle == true{
            wasteArray.append(element.cName)
        }
        // set the waste label to the appropriate names
        cell.wasteLabel.text = wasteArray.joined(separator: ", ")
        
        // set the day label
        cell.dayLabel.text = element.date
        
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
