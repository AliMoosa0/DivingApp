//
//  ViewTheDivesTVC.swift
//  DivingApp
//
//  Created by ALI MOOSA on 27/12/2022.
//

import UIKit

class ViewTheDivesTVC: UITableViewController {
    
    @IBOutlet weak var editDiveButton: UIButton!
    
    
    
    var dive = Dive(id: UUID(), diveNumber: 0, surfaceInterval: 0.0, timeIn: Date(), timeOut: Date(), maxDepth: 0.0, avgDepth: 0.0, buttomTime: 0.0, tankType: .none, tankCap: .none, airIn: 0.0, airOut: 0.0, suiteType: .none, wieght: 0.0, gasMix: 0.0, computer: "", camera: "", wetherType: .none, swell: .none, airTemp: 0.0, waterTemp: 0.0, visibility: 0.0, notes: "")
    
    
    
    @IBAction func doneButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    @IBOutlet weak var DiveNoLbl: UILabel!
    @IBOutlet weak var SurfaceLbl: UILabel!
    @IBOutlet weak var TimeInLbl: UILabel!
    @IBOutlet weak var TimeOutLbl: UILabel!
    @IBOutlet weak var MaxDepthLbl: UILabel!
    @IBOutlet weak var AvgDepth: UILabel!
    @IBOutlet weak var BottomTimeLbl: UILabel!
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
    @IBOutlet weak var WaterTempLbl: UILabel!
    @IBOutlet weak var AirTempLbl: UILabel!
    @IBOutlet weak var VisibilityLbl: UILabel!
    
    
    @IBOutlet weak var NotesLbl: UILabel!
    
    
    func upadteLabels(){
        DiveNoLbl.text = String(dive.diveNumber)
        SurfaceLbl.text = String("\(dive.surfaceInterval!)")
        TimeOutLbl.text = String("\(dive.timeOut!)")
        TimeInLbl.text = String("\(dive.timeIn!)")
        MaxDepthLbl.text = String("\(dive.maxDepth!)")
        BottomTimeLbl.text = String("\(dive.buttomTime!)")
        TankTypeLbl.text = String("\(dive.tankType!)")
        CapacityLbl.text = String("\(dive.tankCap!)")
        AirInLbl.text = String("\(dive.airIn!)")
        SwellingLbl.text = String("\(dive.swell!)")
        AirOutLbl.text = String ("\(dive.airOut!)")
        SuitTypeLbl.text = String ("\(dive.suiteType!)")
        AvgDepth.text = String ("\(dive.avgDepth!)")
        WeightLbl.text = String ("\(dive.wieght!)")
        GasMixLbl.text = String ("\(dive.gasMix!)")
        ComputerLbl.text = String ("\(dive.computer!)")
        CameraLbl.text = String ("\(dive.camera!)")
        WaterTempLbl.text = String ("\(dive.waterTemp!)")
        AirTempLbl.text = String ("\(dive.airTemp!)")
        VisibilityLbl.text = String ("\(dive.visibility!)")
        NotesLbl.text = String ("\(dive.notes!)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        upadteLabels()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    
    @IBSegueAction func editDive(_ coder: NSCoder, sender: Any?) -> AddEditDivesTableViewController? {
        let editDiveController =
        AddEditDivesTableViewController(coder: coder)
        
        if (sender as? UIButton == editDiveButton){
            editDiveController?.dive = dive
            return editDiveController
        }else{
        
        
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
