//
//  AddEditDivesTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 21/12/2022.
//

import UIKit
protocol AddEditDivesTableViewControllerDelegate: AnyObject {
    func diveDetailTableViewController(_ controller: AddEditDivesTableViewController, didSave dive: Dive)
}

class AddEditDivesTableViewController: UITableViewController,
                                       SelectTankCapTVCDelegate, SelectSwellTVCDelegate, SelectTankTypeTVCDelegate, SelectWeatherConditionTVCDelegate, SelectSuiteTypeTVCDelegate{
   
    
    
    weak var delegate: AddEditDivesTableViewControllerDelegate?
    
    
    
    
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
    
    @IBOutlet weak var weatherTempTF: UITextField!
    
    @IBOutlet weak var airTempTF: UITextField!
    
    @IBOutlet weak var visibilyTF: UITextField!
    
    
    //MARK: -

    
    
    @IBOutlet weak var swellingLvl: UILabel!
    
    
   
    
    //MARK: -

    
    
    
  
    
    
    
    //MARK: -

    
    @IBOutlet weak var notesTF: UITextView!
    
    
    // MARK: - functions and methods
    var tankTypel : TankType?
    var tankcapl :TankCap?
    var suiteTypel : SuiteType?
    var weatherl : Weather?
    var swellLvll : Swell?

    
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
        let tankTypeP = tankTypel!
        
    
        let tankcapP = tankcapl!
        
        let airIn = airInTF.text ?? ""
        let airOut = airOutTF.text ?? ""
        

        let suiteTypeP = suiteTypel!

    
        let weatherP = weatherl!
        
        let swellLvlP = swellLvll!
  
        let airTemp = airTempTF.text ?? ""
        let WaterTemp = weatherTempTF.text ?? ""
        let Visibility = visibilyTF.text ?? ""
        
        
        let notes = notesTF.text ?? ""
        
        
        if dive != nil{
            //var diveNumberInt = Int(noOfDives)
            dive?.diveNumber = Int(noOfDives)!
            dive?.tankType = tankTypeP
            dive?.tankCap = tankcapP
            dive?.suiteType = suiteTypeP
            dive?.wetherType = weatherP
            dive?.swell = swellLvlP
            
            dive?.surfaceInterval = Double(surfaceIntreval)!
            dive?.timeIn = timeInThePicker
            dive?.timeOut = timeOutThePicker
            dive?.maxDepth = Double(maxDepth)!
            dive?.avgDepth = Double(avgDepth)!
            dive?.buttomTime = Double(buttomTime)!

            dive?.airIn = Double(airIn)!
            dive?.airOut = Double(airOut)!

            dive?.airTemp = Double(airTemp)!
            dive?.waterTemp = Double(WaterTemp)!
            dive?.visibility = Double(Visibility)!
            
            //MARK: -

            dive?.notes = notes
            
            //MARK: -

            
            
            
            
        }else{
            
           
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
    @IBSegueAction func showWeatherCondition(_ coder: NSCoder) -> SelectWeatherConditionTVC?{
        let typeController = SelectWeatherConditionTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    @IBSegueAction func showTankType(_ coder: NSCoder) -> SelectTankTypeTVC?{
        let typeController = SelectTankTypeTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    @IBSegueAction func showTankCap(_ coder: NSCoder) -> SelectTankCapTVC?{
        let typeController = SelectTankCapTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    @IBSegueAction func showSuiteType(_ coder: NSCoder) -> SelectSuiteTypeTVC?{
        let typeController = SelectSuiteTypeTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    @IBSegueAction func showSwell(_ coder: NSCoder) -> SelectSwellTVC?{
        let typeController = SelectSwellTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    
    
    
    func selectWeatherConditionTVC(_ controller: SelectWeatherConditionTVC, didSelect weather: Weather) {
        self.weatherl = weather
        weatherCondition.textColor = .black
        weatherCondition.text = weather.description
    }
    
    func selectSuiteTypeTVC(_ controller: SelectSuiteTypeTVC, didSelect suiteTypel: SuiteType) {
        self.suiteTypel = suiteTypel
        suiteType.textColor = .black
        suiteType.text = suiteTypel.description
    }
    
    func selectTankCapTVC(_ controller: SelectTankCapTVC, didSelect tankCapl: TankCap) {
        self.tankcapl = tankCapl
        tankCapLabel.textColor = .black
        tankCapLabel.text = tankCapl.description
    }
    func selectSwellTVC(_ controller: SelectSwellTVC, didSelect swell: Swell) {
        self.swellLvll = swell
        swellingLvl.textColor = .black
        swellingLvl.text = swell.description
    }
    func selectTankTypeTVC(_ controller: SelectTankTypeTVC, didSelect tankTypel: TankType) {
        self.tankTypel = tankTypel
        tankType.textColor = .black
        tankType.text = tankTypel.description
    }
    
}
