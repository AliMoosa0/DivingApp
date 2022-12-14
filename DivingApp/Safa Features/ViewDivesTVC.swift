//
//  ViewDivesTVC.swift
//  DivingApp
//
//  Created by Safa Juma on 21/12/2022.
//

import UIKit

class ViewDivesTVC: UITableViewController, UISearchBarDelegate {
    //empty dives array
    var dives:[Dive] = []
    // dives of selected trip to load sample data
    var divesOfSelectedTrip: [Dive] = []
    // trip var to edit this trip
    var trip = Trip(title: "", location: "", tripDate: Date(), dives: [])
    // empty array of all the dives
    var allDives : [Dive] = []
    
    
    // search bar related variables
    var searchDive: [Dive] = []
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var editTripButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        searchBar.delegate = self
        self.sortTable()
        
        if let savedDives = Dive.loadDives(from: "\(trip.id)"){
            dives = savedDives
        }else{
            dives = divesOfSelectedTrip
        }
        
        if let savedAllDives = Dive.loadAllDives(){
            allDives = savedAllDives
        }else{
            dives = divesOfSelectedTrip
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindToDivesList(segue: UIStoryboardSegue){
        print("unwind")
        guard segue.identifier == "saveDiveUnwind" else {return}
        
        let sourceViewController = segue.source as! AddEditDivesTableViewController
        print("unwind form save")
        
        if let dive = sourceViewController.dive{
            if let indexOfExistingDive = dives.firstIndex(of: dive){
                print("saving existing dive")
                
                dives[indexOfExistingDive] = dive
                tableView.reloadRows(at: [IndexPath(row: indexOfExistingDive, section: 0)], with: .automatic)
                
            }else{
                print("saving existing dive")
                
                let newIndexPath = IndexPath(row: dives.count, section: 0)
                dives.append(dive)
                allDives.append(dive)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                
             

            }
            
        }
        
        Dive.saveDives(dives, to: "\(trip.id)")
        Dive.saveAllDives(allDives)
    }
    
    
    
    //Delete function
    func presentDeleteAlert(indexPath: IndexPath){
        let alert = UIAlertController(title: "Delete Dive", message: "Are you sure you want to delete this dive?", preferredStyle: .alert)
        
        //delete action
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { ACTION in
            self.dives.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            Dive.saveDives(self.dives, to: "\(self.trip.id)")
            Dive.saveAllDives(self.allDives)
        })

        
        //cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    // sort functions
    func sortTable(){
        switch sortSegmentedControl.selectedSegmentIndex{
        case 0:
            dives.sort(by: {$0.diveNumber > $1.diveNumber })
        case 1:
            dives.sort(by: {$0.diveNumber < $1.diveNumber })
        case 2:
            dives.sort(by: {$0.maxDepth ?? 0.0 > $1.maxDepth ?? 0.0})
        default:
            print("this default is just to fix the error")
        }
        tableView.reloadData()
    }
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        sortTable()
    }
    
    
    //EDITING A TRIP
    
    @IBSegueAction func editTrip(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        let editTripController = AddEditTableViewController(coder: coder)
        
        if (sender as? UIBarButtonItem === editTripButton){
            editTripController?.trip = trip
            return editTripController
        }else{
            return editTripController
        }
        
        //return <#AddEditTableViewController(coder: coder)#>
    }
    
    
    // MARK: - Table view data source
    
    /*
     override func numberOfSections(in tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 1
     }
     */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return dives!.count
        //if let dives = dives {
        if searching{
            return searchDive.count
        }else{
            return dives.count
        }
        //        }else{
        //            return 0
        //        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "divesCell", for: indexPath) as! DiveCell
        
        // Configure the cell...
        
        if searching{
            let dive = searchDive[indexPath.row]
            cell.diveNumberLabel.text = "Dive number \(dive.diveNumber )"
            cell.descriptionLabel.text = "Max depth: \(dive.maxDepth ?? 0.0)"
        }else{
            let dive = dives[indexPath.row]
            cell.diveNumberLabel.text = "Dive number \(dive.diveNumber )"
            cell.descriptionLabel.text = "Max depth: \(dive.maxDepth ?? 0.0)"
        }
        
        
        // Return cell
        return cell
    }
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            presentDeleteAlert(indexPath: indexPath)
           
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     let movedCell = dives!.remove(at: fromIndexPath.row)
     dives!.insert(movedCell, at: to.row)
     }
     */
    
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "viewDiveDetails" else
        {return}
        // Get the new view controller using segue.destination.
        let nav = segue.destination as! UINavigationController
        let viewDiveDetails = nav.topViewController as! ViewTheDivesTVC
        // Pass the selected object to the new view controller.
        guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell)
        else {return}
        
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        let dive = dives[indexPath.row]
        print(dive)
        viewDiveDetails.dive = dive
    }
    
    
    // search bar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchDive = dives.filter({String($0.diveNumber ) == searchText})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}
