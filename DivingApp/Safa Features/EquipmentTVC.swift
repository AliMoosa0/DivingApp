//
//  EquipmentTVC.swift
//  DivingApp
//
//  Created by ALI MOOSA and Safa Juma on 29/12/2022.
//

import UIKit

class EquipmentTVC: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchEquipment = [String]()
    var searching = false
    
    
    let equipment : [String] = ["Regulator","Mask", "Snorkel", "Wetsuit", "Defog", "Fins and booties", "Surface Marker Buoy", "Dive weight", "Dive Computer", "Diving Knife", "Dive Light", "Tank Bangers", "Compass", "Writing Slates", "First Aid Kit", "Dry box", "Underwater Camera"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @objc func checkButtonClicked( sender: UIButton){
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
       
    }
    
    // search bar functions
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchEquipment = equipment.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searching{
            return searchEquipment.count
        }else{
            return equipment.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentCell", for: indexPath) as! EquipmentCell

        // Configure the cell...

        if searching{
            let item = searchEquipment[indexPath.row]
            cell.equipmentLabel?.text = item
        }else{
            let item = equipment[indexPath.row]
            cell.equipmentLabel?.text = item
        }
        
        cell.selectionStyle = .none
        cell.checkButton?.addTarget(self, action: #selector(checkButtonClicked(sender:)), for: .touchUpInside)
        // return the cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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