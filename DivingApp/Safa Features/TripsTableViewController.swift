//
//  TripsTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 17/12/2022.
//

import UIKit

class TripsTableViewController: UITableViewController, UISearchBarDelegate {

    var trips = [Trip]()
    
    var searchTrip = [Trip]()
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortSegmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        searchBar.delegate = self
        trips = Trip.loadSampleLoad()
        
        /*
        if let savedTrips = Trip.loadTrips(){
            trips = savedTrips
        }else{
            trips = Trip.loadSampleLoad()
        }
        */
         
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwindToTripList(segue: UIStoryboardSegue){
            guard segue.identifier == "saveUnwind" else {return}
            let sourceViewController = segue.source as! AddEditTableViewController
            
        if let trip = sourceViewController.trip{
            let newIndexPath = IndexPath(row: trips.count, section: 0)
            
            trips.append(trip)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        Trip.saveTrips(trips)
        }
    
    //Delete function
    func presentDeleteAlert(indexPath: IndexPath){
        let alert = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip?", preferredStyle: .alert)
        
        //delete action
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: {ACTION in self.trips.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        })
        
        //cancel action
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        switch sortSegmentedControl.selectedSegmentIndex{
        case 0:
            trips.sort(by: {$0.title == $1.title})
        case 1:
            trips.sort(by: {$0.title < $1.title})
        case 2:
            trips.sort(by: {$0.location < $1.location})
        case 3:
            trips.sort(by: {$0.tripDate < $1.tripDate})
        case 4:
            trips.sort(by: {$0.tripDate > $1.tripDate})
        default:
            print("this default is just to fix the error")
        }
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
            return searchTrip.count
        }else{
            return trips.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tripCell", for: indexPath) as! TripCell
       
        // Configure the cell...
        
        if searching {
            let trip = searchTrip[indexPath.row]
            cell.tripNameLabel.text = trip.title
            cell.descriptionLabel.text = "\(trip.location) - \(trip.tripDate)"
        }else{
            let trip = trips[indexPath.row]
            cell.tripNameLabel.text = trip.title
            cell.descriptionLabel.text = "\(trip.location) - \(trip.tripDate)"
        }
        
        // Return the cell
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
        guard segue.identifier == "viewDives" else {return}
        // Get the new view controller using segue.destination.
        let nav = segue.destination as! UINavigationController
        let viewDivesTVC = nav.topViewController as! ViewDivesTVC
        // Pass the selected object to the new view controller.
        let cell = sender as? UITableViewCell
        let indexPath = tableView.indexPath(for: cell!)
        
        tableView.deselectRow(at: indexPath!, animated: true)
        
        let trip = trips[indexPath!.row]
        viewDivesTVC.trip = trip
        viewDivesTVC.dives = trip.dives

    }
    
    //search bar functions
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTrip = trips.filter({$0.title.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}
