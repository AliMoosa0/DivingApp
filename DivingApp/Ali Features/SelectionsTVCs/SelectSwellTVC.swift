//
//  SelectSwellTVC.swift
//  DivingApp
//
//  Created by ALI MOOSA on 24/12/2022.
//

import UIKit

protocol  SelectSwellTVCDelegate: AnyObject{
    func selectSwellTVC(_ controller: SelectSwellTVC, didSelect swell: Swell )
}

class SelectSwellTVC: UITableViewController {

    var delegate: SelectSwellTVCDelegate?

    var swell :Swell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //    SwellCell
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Swell.allCases.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SwellCell", for: indexPath)
        
        let type = Swell.allCases[indexPath.row]
        cell.textLabel?.text = type.description

        if swell == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = Swell.allCases[indexPath.row]
        self.swell = type
        delegate?.selectSwellTVC(self, didSelect: type)
        tableView.reloadData()
    }
    


}
