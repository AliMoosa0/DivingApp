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

class AddEditDivesTableViewController: UITableViewController,SelectTankTypeTVCDelegate, SelectSwellTVCDelegate, SelectTankCapTVCDelegate, SelectWeatherConditionTVCDelegate, SelectSuiteTypeTVCDelegate{
   
    
    
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
    @IBOutlet weak var tankTypeLabel: UILabel!
    
    

    
    
    
    
    //MARK: -
    
   
    @IBOutlet weak var tankCapLabel: UILabel!
    
    
    //MARK: -
    
    
    
    
    
    
    @IBOutlet weak var airInTF: UITextField!
    
    @IBOutlet weak var airOutTF: UITextField!
    
    //MARK: -
    
    @IBOutlet weak var suiteTypeLabel: UILabel!
    
    
    
   
    
    //MARK: -
    
    
    
    
    
    
    @IBOutlet weak var wieghtTF: UITextField!
    
    @IBOutlet weak var gassMixTF: UITextField!
    
    @IBOutlet weak var computerTF: UITextField!
    
    @IBOutlet weak var cameraTF: UITextField!
    
    //MARK: -

    
    @IBOutlet weak var weatherConditionLabel: UILabel!
    
    @IBOutlet weak var weatherTempTF: UITextField!
    
    @IBOutlet weak var airTempTF: UITextField!
    
    @IBOutlet weak var visibilyTF: UITextField!
    
    
    //MARK: -

    
    
    @IBOutlet weak var swellingLvlLabel: UILabel!
    
    
   
    
    //MARK: - time pickers
    
    

    
    
    
  
    
    
    
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

        
        let wieght = wieghtTF.text ?? ""
        let gasMix = gassMixTF.text ?? ""
        let computer  = computerTF.text ?? ""
        let camera  = cameraTF.text ?? ""
        
        
        
    
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
            
            dive?.wieght = Double(wieght)!
            dive?.gasMix = Double(gasMix)!
            dive?.computer = computer
            dive?.camera = camera
            
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
            dive = Dive(diveNumber: Int(noOfDives)!,
                        surfaceInterval: Double(surfaceIntreval)!,
                        timeIn: timeOutThePicker,
                        timeOut: timeOutThePicker,
                        maxDepth: Double(maxDepth),
                        avgDepth: Double(avgDepth),
                        buttomTime: Double(buttomTime),
                        tankType: tankTypel,
                        tankCap: tankcapl,
                        airIn: Double(airIn),
                        airOut: Double(airOut),
                        suiteType: suiteTypel,
                        wieght: Double(wieght),
                        gasMix: Double(gasMix),
                        computer: computer,
                        camera: camera,
                        wetherType: weatherl,
                        swell: swellLvll,
                        airTemp: Double(airTemp),
                        waterTemp: Double(WaterTemp),
                        visibility: Double(Visibility),
                        notes: notes)
           
        }
        
    }
    
    //MARK: - Update the date
    func updateDateViews(){
       
        
        
        timeInLabel.text = timeInPicker.date.formatted(date: .abbreviated, time: .omitted)
        timeOutLabel.text = timeOutPicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    
    @IBAction func pickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    // MARK: - hide unhide the pickers
    
    
   
    
    
    
    let timeInCellIndexPath = IndexPath(row: 1, section: 1)
    let timeInPickerCellIndexPath = IndexPath(row: 2, section: 1)
    
    
    let timeOutLableCellIndexPath = IndexPath(row: 3, section: 1)
    let timeoutPickerCellIndexPath = IndexPath(row: 4, section: 1)
   
    
    
    
    var isTimeInPickerVisible : Bool = false{
    didSet{
        timeInPicker.isHidden = !isTimeInPickerVisible
        
    }
    
    }
    
    
    var isTimeOutPickerVisible : Bool = false{
    didSet{
        timeInPicker.isHidden = !isTimeOutPickerVisible
        
    }
    
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
            
            
        case timeInPickerCellIndexPath where isTimeInPickerVisible == false :
            return 0
            
            
            
        case timeoutPickerCellIndexPath where isTimeOutPickerVisible == false :
            return 0
            
            
            
        default :
            return UITableView.automaticDimension
            
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
            
        case timeInPickerCellIndexPath :
            return 190
            
        case timeoutPickerCellIndexPath :
            return 190
            
        default:
            return UITableView.automaticDimension
            
            
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        if indexPath == timeInCellIndexPath && isTimeOutPickerVisible == false {
            // TimeIn lablel selected , timeOut picker is not visible, toggle timeIn picker
            isTimeInPickerVisible.toggle()
            
       }else if indexPath == timeOutLableCellIndexPath && isTimeInPickerVisible == false {
            // TimeOut lablel selected , TimeIn picker is not visible, toggle timeOut picker
            isTimeOutPickerVisible.toggle()
            
        }else if  indexPath == timeInCellIndexPath ||
                    indexPath == timeOutLableCellIndexPath {
            // eather lable was selected , previos conditions failed meaning at least one picker is visable, toggle both
            
            isTimeInPickerVisible.toggle()
            isTimeOutPickerVisible.toggle()
        }else{
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        
            
            
        }
        
    
    
    
    func updatetankType(){
        if let tankType = tankTypel{
            tankTypeLabel.text = tankType.description
        }else{
            tankTypeLabel.text = "not set"
        }
    }
    
    func selectTankTypeTVC(_ controller: SelectTankTypeTVC, didSelect tanktype: TankType ){
        self.tankTypel = tanktype
        updatetankType()
        
    }
    
    
    
    
    
    func updatetankCap(){
        if let tankcap = tankcapl{
            tankCapLabel.text = tankcap.description
        }else{
            tankCapLabel.text = "not set"
        }
    }
    func selectTankCapTVC(_ controller: SelectTankCapTVC, didSelect tankCap: TankCap) {
        self.tankcapl = tankCap
        updatetankCap()
        
    }
    
    
    
    
    
    func updateSuiteType(){
        if let suiteType = suiteTypel{
            suiteTypeLabel.text = suiteType.description
        }else{
            suiteTypeLabel.text = "not set"
        }
    }
    func selectSuiteTypeTVC(_ controller: SelectSuiteTypeTVC, didSelect suiteType: SuiteType) {
        self.suiteTypel = suiteType
        updateSuiteType()
    }
    
    
    
    
    
    
    func updateWeather(){
        if let weather = weatherl{
            weatherConditionLabel.text = weather.description
        }else{
            weatherConditionLabel.text = "not set"
        }
    }
    func selectWeatherConditionTVC(_ controller: SelectWeatherConditionTVC, didSelect weather: Weather) {
        self.weatherl = weather
        updateWeather()
    }
    
    
    
    
    func updateSwell(){
        if let swell = swellLvll{
            swellingLvlLabel.text = swell.description
        }else{
            swellingLvlLabel.text = "not set"
        }
    }
    
    func selectSwellTVC(_ controller: SelectSwellTVC, didSelect swell: Swell) {
        self.swellLvll = swell
        updateSwell()
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
        updatetankType()
        updatetankCap()
        updateWeather()
        updateSwell()
        updateSuiteType()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let dive = dive {
            navigationItem.title = "Editing a Dive"
            numOfDivesLabel.text = String(" \(dive.diveNumber)")
            surfaceIntervalTF.text = String(" \(dive.surfaceInterval!)")
            timeInLabel.text = String("\(dive.timeIn!)")
            timeOutLabel.text = String("\(dive.timeOut!)")
            macDepthTF.text = String("\(dive.maxDepth!)")
            avgDepthTF.text = String("\(dive.avgDepth!)")
            bottomTimeTF.text = String("\(dive.buttomTime!)")
            tankTypeLabel.text = String("\(dive.tankType!)")
            tankCapLabel.text = String("\(dive.tankCap!)")
            airInTF.text = String("\(dive.airIn!)")
            airOutTF.text = String("\(dive.airOut!)")
            suiteTypeLabel.text = String("\(dive.suiteType!)")
            wieghtTF.text = String("\(dive.wieght!)")
            gassMixTF.text = String("\(dive.gasMix!)")
            computerTF.text = String("\(dive.computer!)")
            weatherTempTF.text = String("\(dive.waterTemp!)")
            cameraTF.text = String("\(dive.camera!)")
            weatherConditionLabel.text = String("\(dive.wetherType!)")
            airTempTF.text = String("\(dive.airTemp!)")
            visibilyTF.text = String("\(dive.visibility!)")
            swellingLvlLabel.text = String("\(dive.swell!)")
            notesTF.text = String("\(dive.notes!)")
            
        }
        
       
       
    }

    // MARK: - Table view data source
    
    
    @IBSegueAction func showTankTypeS(_ coder: NSCoder) -> SelectTankTypeTVC? {
        let typeController = SelectTankTypeTVC(coder: coder)
        typeController?.delegate = self
        typeController?.tanktype = tankTypel
        return typeController
    }
    
    @IBSegueAction func showTankCapS(_ coder: NSCoder) -> SelectTankCapTVC? {
        let typeController = SelectTankCapTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    
    @IBSegueAction func showSuiteTypeS(_ coder: NSCoder) -> SelectSuiteTypeTVC? {
        let typeController = SelectSuiteTypeTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    @IBSegueAction func showWeatherConditionS(_ coder: NSCoder) -> SelectWeatherConditionTVC? {
        let typeController = SelectWeatherConditionTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
   

    @IBSegueAction func showSwellS(_ coder: NSCoder) -> SelectSwellTVC? {
        let typeController = SelectSwellTVC(coder: coder)
        typeController?.delegate = self
        
        return typeController
    }
    
    
    
    
    
    
    
    
   
    
   
}
