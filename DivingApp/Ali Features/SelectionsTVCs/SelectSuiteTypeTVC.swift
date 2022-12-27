//
//  SelectSuiteTypeTVC.swift
//  DivingApp
//
//  Created by ALI MOOSA on 24/12/2022.
//

import UIKit

protocol  SelectSuiteTypeTVCDelegate: AnyObject{
    func selectSuiteTypeTVC(_ controller: SelectSuiteTypeTVC, didSelect suiteType: SuiteType )
}


class SelectSuiteTypeTVC: UITableViewController {

    var delegate: SelectSuiteTypeTVCDelegate?

    var suiteType :SuiteType?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return SuiteType.allCases.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuiteTypeCell", for: indexPath)
        
        let type = SuiteType.allCases[indexPath.row]
        cell.textLabel?.text = type.description

        if suiteType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = SuiteType.allCases[indexPath.row]
        suiteType = type
        delegate?.selectSuiteTypeTVC(self, didSelect: type)
        tableView.reloadData()
    }
    
    
    
    

}
