//
//  AddEditDivesTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 21/12/2022.
//

import UIKit

class AddEditDivesTableViewController: UITableViewController {
    // MARK: - Form Outlits
    
    @IBOutlet weak var numOfDivesLabel: UITextField!
    
    
    
    @IBOutlet weak var surfaceIntervalLabel: UILabel!
    
    @IBOutlet weak var surfaceIntervalPicker: UIDatePicker!
    
    @IBOutlet weak var timeInLabel: UILabel!
    
    @IBOutlet weak var timeInPicker: UIDatePicker!
    
    @IBOutlet weak var timeOutLabel: UILabel!
    
    @IBOutlet weak var timeOutPicker: UIDatePicker!
    
    @IBOutlet weak var macDepthTF: UITextField!
    
    @IBOutlet weak var avgDepthTF: UITextField!
    
    @IBOutlet weak var bottomTimeTF: UITextField!
    
    
    
    
    
    @IBOutlet weak var aluminiumButton: UIButton!
    
    @IBOutlet weak var steelButton: UIButton!
    
    
    
    
    
    
    @IBOutlet weak var tenButton: UIButton!
    
    @IBOutlet weak var twelveButton: UIButton!
    
    @IBOutlet weak var fifteenButton: UIButton!
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var airInTF: UITextField!
    
    @IBOutlet weak var airOutTF: UITextField!
    
    
    
    
    
    @IBOutlet weak var shortieButton: UIButton!
    
    @IBOutlet weak var onePieceButton: UIButton!
    
    @IBOutlet weak var twoPieceButton: UIButton!
    
    @IBOutlet weak var semiDryButton: UIButton!
    
    @IBOutlet weak var drySuiteButton: UIButton!
    
    @IBOutlet weak var thicknessTF: UITextField!
    
    
    
    
    
    
    
    
    @IBOutlet weak var wieghtTF: UITextField!
    
    @IBOutlet weak var gassMixTF: UITextField!
    
    @IBOutlet weak var computerTF: UITextField!
    
    @IBOutlet weak var cameraTF: UITextField!
    
    
    
    
    
    
    @IBOutlet weak var sunnyButton: UIButton!
    
    @IBOutlet weak var clowdyButton: UIButton!
    
    @IBOutlet weak var windyButton: UIButton!
    
    @IBOutlet weak var overcastButton: UIButton!
    
    
    
    
    
    
    @IBOutlet weak var noSwellButton: UIButton!
    
    @IBOutlet weak var moderateSwellButton: UIButton!
    
    @IBOutlet weak var strongSwellButton: UIButton!
    
    
    
    
    
    
    @IBOutlet weak var airTempTF: UITextField!
    
    @IBOutlet weak var waterTempTF: UITextField!
    
    @IBOutlet weak var visibilityTF: UITextField!
    
    
    
    
    
    @IBOutlet weak var notesTF: UITextView!
    
    
    // MARK: - functions and methods
    
    
    var dive: Dive?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveDiveUnwind" else {return}
        
        let noOfDives = surfaceIntervalLabel.text ?? ""
        
        
        
        
        let surfaceIntreval = surfaceIntervalPicker.date
        let timeIn = timeInLabel.text ?? ""
        let timeInThePicker = timeInPicker.date
        let timeOut = timeOutLabel.text ?? ""
        let timeOutThePicker = timeOutPicker.date
        let maxDepth = macDepthTF.text ?? ""
        let avgDepth = avgDepthTF.text ?? ""
        let buttomTime = bottomTimeTF.text ?? ""
        
    
        let aluminium = aluminiumButton.isEnabled
        let steel = steelButton.isEnabled
        
        
        let ten = tenButton.isEnabled
        let twelve = twelveButton.isEnabled
        let fifteen = fifteenButton.isEnabled
        
        
        let airIn = airInTF.text ?? ""
        let airOut = airOutTF.text ?? ""
        
        
        
        let shortie = shortieButton.isEnabled
        let onePiece = onePieceButton.isEnabled
        let twoPiece = twoPieceButton.isEnabled
        let semiDry = semiDryButton.isEnabled
        let drySuite = drySuiteButton.isEnabled
        let thickness = thicknessTF.text ?? ""
        
        
        
        
        let wieght = wieghtTF.text ?? ""
        let gasMix = gassMixTF.text ?? ""
        let computer = computerTF.text ?? ""
        let camera = cameraTF.text ?? ""

        
        
        
        
        let sunny = sunnyButton.isEnabled
        let clowdy = clowdyButton.isEnabled
        let windy = windyButton.isEnabled
        let overcast = overcastButton.isEnabled
        
        
        
        let noSwell = noSwellButton.isEnabled
        let moderateSwell = moderateSwellButton.isEnabled
        let strongSwell = strongSwellButton.isEnabled
        
        
        let airTemp = airTempTF.isEnabled
        let WaterTemp = waterTempTF.isEnabled
        let Visibility = visibilityTF.isEnabled
        
        
        let notes = notesTF.text ?? ""
        
        
        
        
        
        
        if dive != nil{
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
