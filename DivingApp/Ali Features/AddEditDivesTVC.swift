//
//  AddEditDivesTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 21/12/2022.
//

import UIKit

class AddEditDivesTableViewController: UITableViewController,
                                       SelectTankCapTVCDelegate{
    func selectTankCapTVC(_ controller: SelectTankCapTVC, didSelect tankType: Tanks) {
        self.tankType = tankType
        updateTankType()
    }
    
    // MARK: - Form Outlits
    
    @IBOutlet weak var numOfDivesLabel: UITextField!
    
    
    
    @IBOutlet weak var surfaceIntervalTF: UITextField!
    
    
    
    @IBOutlet weak var timeInLabel: UILabel!
    
    @IBOutlet weak var timeInPicker: UIDatePicker!
    
    @IBOutlet weak var timeOutLabel: UILabel!
    
    @IBOutlet weak var timeOutPicker: UIDatePicker!
    
    @IBOutlet weak var macDepthTF: UITextField!
    
    @IBOutlet weak var avgDepthTF: UITextField!
    
    @IBOutlet weak var bottomTimeTF: UITextField!
    
    
    
    
    
//MARK: -
    @IBOutlet weak var tankType: UILabel!
    
    

    
    
    
    
    //MARK: -
    
   
    @IBOutlet weak var tankCapLabel: UILabel!
    
    
    //MARK: -
    
    
    
    
    
    
    @IBOutlet weak var airInTF: UITextField!
    
    @IBOutlet weak var airOutTF: UITextField!
    
    //MARK: -
    
    @IBOutlet weak var suiteType: UILabel!
    
    
    
   
    
    //MARK: -
    
    
    
    
    
    
    @IBOutlet weak var wieghtTF: UITextField!
    
    @IBOutlet weak var gassMixTF: UITextField!
    
    @IBOutlet weak var computerTF: UITextField!
    
    @IBOutlet weak var cameraTF: UITextField!
    
    //MARK: -

    
    @IBOutlet weak var weatherCondition: UILabel!
    
    
    
   
    
    //MARK: -

    
    
    @IBOutlet weak var swellingLvl: UILabel!
    
    
   
    
    //MARK: -

    
    
    
    @IBOutlet weak var airTempTF: UITextField!
    
    @IBOutlet weak var waterTempTF: UITextField!
    
    @IBOutlet weak var visibilityTF: UITextField!
    
    
    
    //MARK: -

    
    @IBOutlet weak var notesTF: UITextView!
    
    
    // MARK: - functions and methods
    
    
    var dive: Dive?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveDiveUnwind" else {return}
        
        let noOfDives = numOfDivesLabel.text ?? ""
        
        numOfDivesLabel.becomeFirstResponder()
        
        
        let surfaceIntreval = surfaceIntervalTF.text ?? ""
        let timeInThePicker = timeInPicker.date
        let timeOutThePicker = timeOutPicker.date
        let maxDepth = macDepthTF.text ?? ""
        let avgDepth = avgDepthTF.text ?? ""
        let buttomTime = bottomTimeTF.text ?? ""
        
        //MARK: -

        
        //MARK: -

        
        guard let tankType = tankType else{return}
        
        let airIn = airInTF.text ?? ""
        let airOut = airOutTF.text ?? ""
        
        
        //MARK: -

        
        
        //MARK: -

        
        
       
        
        
        
        //MARK: -

        
        
        //MARK: -

       
        
        //MARK: -

        let airTemp = airTempTF.text ?? ""
        let WaterTemp = waterTempTF.text ?? ""
        let Visibility = visibilityTF.text ?? ""
        
        
        let notes = notesTF.text ?? ""
        
        
        
        
        
        
        if dive != nil{
            //var diveNumberInt = Int(noOfDives)
            dive?.diveNumber = Int(noOfDives)!
            
            
            
            dive?.surfaceInterval = Double(surfaceIntreval)!
            dive?.timeIn = timeInThePicker
            dive?.timeOut = timeOutThePicker
            dive?.maxDepth = Double(maxDepth)!
            dive?.avgDepth = Double(avgDepth)!
            dive?.buttomTime = Double(buttomTime)!
            
            //MARK: -

            
            dive?.isAluminium = aluminium
            dive?.isSteel = steel
            
            
            //MARK: -

            
            dive?.tankCap = Int("\(tankType)")
            
            
            //MARK: -

            dive?.airIn = Double(airIn)!
            dive?.airOut = Double(airOut)!
            //MARK: -

            
            
            
            
            dive?.isShortie = shortie
            dive?.is1Piece = onePiece
            dive?.is2Piece = twoPiece
            dive?.isSemiDry = semiDry
            dive?.isDrySuite = drySuite
            dive?.thickness = Int(thickness)!
            //MARK: -

            
            
            dive?.wieght = Double(wieght)!
            dive?.gasMix = Double(gasMix)!
            dive?.computer = computer
            dive?.camera = camera
            
            //MARK: -

            
            dive?.isSunny = sunny
            dive?.isClowdy = clowdy
            dive?.isWindy = windy
            dive?.isOvercast = overcast
            
            //MARK: -

            
            dive?.isNoSwell = noSwell
            dive?.isModerateSwell = moderateSwell
            dive?.isStrongSwell = strongSwell
            
            //MARK: -

            dive?.airTemp = Double(airTemp)!
            dive?.waterTemp = Double(WaterTemp)!
            dive?.visibility = Double(Visibility)!
            
            //MARK: -

            dive?.notes = notes
            
            //MARK: -

            
            
            
            
        }else{
            
            dive = Dive(diveNumber: Int(noOfDives)!, surfaceInterval: Double(surfaceIntreval)!, timeIn: timeInThePicker, timeOut: timeOutThePicker, maxDepth: Double(maxDepth)!
, avgDepth: Double(avgDepth)!, buttomTime: Double(buttomTime)!, isAluminium: aluminium, isSteel: steel, tankCap: Int("\(tankType)"), airIn: Double(airIn)!, airOut: Double(airOut)!, isShortie: shortie, is1Piece: onePiece, is2Piece: twoPiece, isSemiDry: semiDry, isDrySuite: drySuite, thickness: Int(thickness)!, wieght: Double(wieght)!, gasMix: Double(gasMix)!, computer: computer, camera: camera, isSunny: sunny, isClowdy: clowdy, isWindy: windy, isOvercast: overcast, isNoSwell: noSwell, isModerateSwell: moderateSwell, isStrongSwell: strongSwell, airTemp: Double(airTemp)!, waterTemp: Double(WaterTemp)!, visibility: Double(Visibility)!, notes: notes)
        }
        
    }
    var tankType : Tanks?
    
    
    func selectTankType(_ controller: SelectTankCapTVC, didSelect tankType: Tanks) {
        self.tankType = tankType
        updateTankType()
    }
    
    
   
    func updateTankType(){
        if let tankType = tankType {
            tankCapLabel.text = "\(tankType.tankcap)"
        }else{
            tankCapLabel.text = "  NOT SET  "
        }
    }
/*
  @IBAction func selectTankType(_ coder: NSCoder) -> SelectTankCapTVC? {//
        let selectTankTypeController = DivingApp.SelectTankCapTVC(coder: coder)
        
        
        selectTankTypeController?.delegate = self
        selectTankTypeController?.tankType = tankType
        
        
        return selectTankTypeController
    
    }
    */
    
    
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
