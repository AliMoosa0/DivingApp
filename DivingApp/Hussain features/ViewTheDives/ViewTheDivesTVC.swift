//
//  ViewTheDivesTVC.swift
//  DivingApp
//
//  Created by Hussain ali on 27/12/2022.
//

import UIKit

class ViewTheDivesTVC: UITableViewController {
    
    

    
    
    
    @IBOutlet weak var editDiveButton: UIButton!
    
    
    // Property to hold the dive object
    var dive = Dive(id: UUID(), diveNumber: 0, surfaceInterval: 0.0, timeIn: Date(), timeOut: Date(), maxDepth: 0.0, avgDepth: 0.0, buttomTime: 0.0, tankType: .none, tankCap: .none, airIn: 0.0, airOut: 0.0, suiteType: .none, wieght: 0.0, gasMix: 0.0, computer: "", camera: "", wetherType: .none, swell: .none, airTemp: 0.0, waterTemp: 0.0, visibility: 0.0, notes: "")
    
    
    // Outlet for the done button

    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //Outlet for labels
    @IBOutlet weak var DiveNoLbl: UILabel!
    @IBOutlet weak var SurfaceLbl: UILabel!
    @IBOutlet weak var TimeInLbl: UILabel!
    @IBOutlet weak var TimeOutLbl: UILabel!
    @IBOutlet weak var MaxDepthLbl: UILabel!
    @IBOutlet weak var AvgDepth: UILabel!
    @IBOutlet weak var BottomTimeLbl:UILabel!
    @IBOutlet weak var TankTypeLbl: UILabel!
    @IBOutlet weak var CapacityLbl: UILabel!
    @IBOutlet weak var AirInLbl: UILabel!
    @IBOutlet weak var SwellingLbl: UILabel!
    @IBOutlet weak var AirOutLbl: UILabel!
    @IBOutlet weak var SuitTypeLbl: UILabel!
    @IBOutlet weak var WeightLbl: UILabel!
    @IBOutlet weak var GasMixLbl: UILabel!
    @IBOutlet weak var ComputerLbl: UILabel!
    @IBOutlet weak var CameraLbl: UILabel!
    @IBOutlet weak var WaterTempLbl:UILabel!
    @IBOutlet weak var AirTempLbl: UILabel!
    @IBOutlet weak var VisibilityLbl:UILabel!
    @IBOutlet weak var wetherLbl: UILabel!
    
    @IBOutlet weak var NotesLbl: UILabel!
    
    // Method to update the labels
    func upadteLabels(){
        DiveNoLbl.text = String("\(dive.diveNumber ?? 0)")
                SurfaceLbl.text = String("\(dive.surfaceInterval ?? 0.0)")
                TimeOutLbl.text = String("\(dive.timeOut ?? .none)")
                TimeInLbl.text = String("\(dive.timeIn ?? .none)")
                MaxDepthLbl.text = String("\(dive.maxDepth ?? 0.0)")
                BottomTimeLbl.text = String("\(dive.buttomTime ?? 0.0)")
                TankTypeLbl.text = String("\(dive.tankType ?? .none)")
                CapacityLbl.text = String("\(dive.tankCap ?? .none)")
                AirInLbl.text = String("\(dive.airIn ?? 0.0)")
                wetherLbl.text = String("\(dive.wetherType ?? .none)")
                SwellingLbl.text = String("\(dive.swell ?? .none)")
                AirOutLbl.text = String ("\(dive.airOut ?? 0.0)")
                SuitTypeLbl.text = String ("\(dive.suiteType ?? .none)")
                AvgDepth.text = String ("\(dive.avgDepth ?? 0.0)")
                WeightLbl.text = String ("\(dive.wieght ?? 0.0)")
                GasMixLbl.text = String ("\(dive.gasMix ?? 0.0)")
                ComputerLbl.text = String ("\(dive.computer ?? "Not set")")
                CameraLbl.text = String ("\(dive.camera ?? "Not set")")
                WaterTempLbl.text = String ("\(dive.waterTemp ?? 0.0)")
                AirTempLbl.text = String ("\(dive.airTemp ?? 0.0)")
                VisibilityLbl.text = String ("\(dive.visibility ?? 0.0)")
                NotesLbl.text = String ("\(dive.notes ?? "")")
        
        if let timeIn = dive.timeIn {
            TimeInLbl.text = String("\(timeIn)")
        }
        if let timeOut = dive.timeOut {
            TimeOutLbl.text = String("\(timeOut)")
        }
        if let tankType = dive.tankType {
            TankTypeLbl.text = String("\(tankType)")
        }
        if let weatherType = dive.wetherType {
            wetherLbl.text = String("\(weatherType)")
        }
        if let tankCapacity = dive.tankCap {
            CapacityLbl.text = String("\(tankCapacity)")
        }
        if let suitType = dive.suiteType {
            SuitTypeLbl.text = String("\(suitType)")
        }
        if let swellingLvl = dive.swell {
            SwellingLbl.text = String("\(swellingLvl)")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // call function to update the labels with current dive data
        upadteLabels()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        // print dive data for debugging purposes
        print(dive)
        // call function to update the labels with current dive data
        upadteLabels()
        //format the dates
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        TimeInLbl.text = dateFormatter.string(from: dive.timeIn!)
        TimeOutLbl.text = dateFormatter.string(from: dive.timeOut!)

        
    }


    @IBSegueAction func editDive(_ coder: NSCoder, sender: Any?) -> AddEditDivesTableViewController? {
        let editDiveController = AddEditDivesTableViewController(coder: coder)
        
        // check if the edit button was pressed
        if (sender as? UIButton == editDiveButton){
            // set the dive data for the edit screen
            editDiveController?.dive = dive
            return editDiveController
        }else{
            // return the edit dive controller in any other case
            return editDiveController
        }
    }

    
    
    
    
    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
*/
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
