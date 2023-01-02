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

class AddEditDivesTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    
   
    
    
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
    
    
   
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDive()
       // updatetankType()
       // updatetankCap()
       // updateWeather()
       // updateSwell()
        //updateSuiteType()
        
        slectedTankType.inputView = tankTypePicker
        
       
        tankTypePicker.delegate = self
        tankTypePicker.dataSource = self
        tankCapPicker.delegate = self
        tankCapPicker.dataSource = self

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
       
        
       
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    

    
    
    
  
    
    
    
   

    
   
    @IBOutlet weak var notesTF: UITextField!
    
    
    
    // MARK: - functions and methods
    var tankType : TankType?
    var tankCap :TankCap?
    var suiteType : SuiteType?
    var weather : Weather?
    var swellLvl : Swell?

    
    //MARK:  - tanktype picker
    
    @IBOutlet weak var slectedTankType: UITextField!
    
    
    
    var arrTanktype = ["Aluminuim", "Steel" ]
    let tankTypePicker = UIPickerView()

    func numberOfComponents(in tankTypePicker: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ tankTypePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrTanktype.count
    }

    func pickerView(_ tankTypePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrTanktype[row]
    }

    func pickerView(_ tankTypePicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        slectedTankType.text = arrTanktype[row]
    }

    //MARK:  - tankCap picker
    @IBOutlet weak var slectedtankcap: UITextField!
    var arrTankcap = ["10", "12", "15" ]
    let tankCapPicker = UIPickerView()

    func numberOfComponents(in tankCapPicker: UIPickerView) -> Int {
        return 1
    }


    func pickerView(_ tankCapPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrTankcap.count
    }

    func pickerView(_ tankCapPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrTankcap[row]
    }

    func pickerView(_ tankCapPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        slectedtankcap.text = arrTankcap[row]
    }
    
    
    
    //MARK:  - suiteType picker
    @IBOutlet weak var slectedSuiteType: UITextField!

    
    //MARK:  - weather picker
    @IBOutlet weak var slectedWeather: UITextField!

    
    //MARK:  - Swell picker
    
    @IBOutlet weak var slectedSwell: UITextField!

    //MARK: - update the text fields
    
    func updateDive(){
        
        if let dive = dive {
            navigationItem.title = "Editing the Dive"
            numOfDivesLabel.text = String(" \(dive.diveNumber!)")
            surfaceIntervalTF.text = String(" \(dive.surfaceInterval!)")
            timeInLabel.text = String("\(dive.timeIn!)")
            timeOutLabel.text = String("\(dive.timeOut!)")
            macDepthTF.text = String("\(dive.maxDepth!)")
            avgDepthTF.text = String("\(dive.avgDepth!)")
            bottomTimeTF.text = String("\(dive.buttomTime!)")
            
            tankTypeLabel.text = dive.tankType?.description
            tankCapLabel.text = dive.tankCap?.description
            
            airInTF.text = String("\(dive.airIn!)")
            airOutTF.text = String("\(dive.airOut!)")
            
            suiteTypeLabel.text = dive.suiteType?.description
            
            wieghtTF.text = String("\(dive.wieght!)")
            gassMixTF.text = String("\(dive.gasMix!)")
            computerTF.text = String("\(dive.computer!)")
            weatherTempTF.text = String("\(dive.waterTemp!)")
            cameraTF.text = String("\(dive.camera!)")
            
            
            
            
            
         
            
            weatherConditionLabel.text = dive.wetherType?.description
            
            airTempTF.text = String("\(dive.airTemp!)")
            visibilyTF.text = String("\(dive.visibility!)")
            swellingLvlLabel.text = dive.swell?.description
            notesTF.text = String("\(dive.notes!)")
            
        }else{
            navigationItem.title = "New Dive"
        }
    }
    //MARK: - Prepare
    var dive: Dive?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveDiveUnwind" else {return}
        
        let noOfDives = Int(numOfDivesLabel.text!)!
        let surfaceIntreval = Double(surfaceIntervalTF.text!)!
        let timeInThePicker = timeInPicker.date
        let timeOutThePicker = timeOutPicker.date
        let maxDepth = Double(macDepthTF.text!)!
        let avgDepth = Double(avgDepthTF.text!)!
        let bottomTime = Double(bottomTimeTF.text!)!
        let tankType = tankType
        let tankCap = tankCap
        let airIn = Double(airInTF.text!)
        let airOut = Double(airOutTF.text!)
        let suiteType = suiteType
        let weight = Double(wieghtTF.text!)
        let gasMix = Double(gassMixTF.text!)
        let computer = computerTF.text!
        let camera = cameraTF.text!
        let weatherCondition = weather
        let weatherTemp = Double(weatherTempTF.text!)
        let airTemp = Double(airTempTF.text!)
        let visibility = Double(visibilyTF.text!)
        let swellingLvl = swellLvl
        let notes = notesTF.text
        
        // Dive is not nil, so we can safely access its properties and methods
        if dive != nil {
           
            
            
            // Update the dive object with the new values
            dive?.diveNumber = noOfDives
            dive?.surfaceInterval = surfaceIntreval
            dive?.timeIn = timeInThePicker
            dive?.timeOut = timeOutThePicker
            dive?.maxDepth = maxDepth
            dive?.avgDepth = avgDepth
            dive?.buttomTime = bottomTime
            dive?.tankType = tankType
            dive?.tankCap = tankCap
            dive?.airIn = airIn
            dive?.airOut = airOut
            dive?.suiteType = suiteType
            dive?.wieght = weight
            dive?.gasMix = gasMix
            dive?.computer = computer
            dive?.camera = camera
            dive?.wetherType = weatherCondition
            dive?.waterTemp = weatherTemp
            dive?.airTemp = airTemp
            dive?.visibility = visibility
            dive?.swell = swellingLvl
            dive?.notes = notes
            
           
        } else {
            // Dive is nil, so we need to create a new dive object
            
          

            dive = Dive(id: UUID(), diveNumber: noOfDives, surfaceInterval: surfaceIntreval, timeIn: timeInThePicker, timeOut: timeOutThePicker, maxDepth: maxDepth, avgDepth: avgDepth, buttomTime: bottomTime, tankType: tankType, tankCap: tankCap, airIn: airIn, airOut: airOut, suiteType: suiteType, wieght: weight, gasMix: gasMix, computer: computer, camera: camera, wetherType: weather, swell: swellLvl, airTemp: airTemp, waterTemp: weatherTemp, visibility: visibility, notes: notes)
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
        
    
    


   
    
 

    // MARK: - show the selections
    
    /*
    @IBSegueAction func showTankTypeS(_ coder: NSCoder) -> SelectTankTypeTVC? {
        let typeController = SelectTankTypeTVC(coder: coder)
        typeController?.delegate = self
        typeController?.tanktype = tankType
        return typeController
    }
    */
    /*
    func updatetankType(){
        if let tankType = tankType{
            tankTypeLabel.text = tankType.description
        }else{
            tankTypeLabel.text = "not set"
        }
    }
     */
    /*
    func selectTankTypeTVC(_ controller: SelectTankTypeTVC, didSelect tanktype: TankType ){
        self.tankType = tanktype
        updatetankType()
        
    }
    */
    
    
    
    
    
    @IBSegueAction func showTankCapS(_ coder: NSCoder) -> SelectTankCapTVC? {
        let typeController = SelectTankCapTVC(coder: coder)
       // typeController?.delegate = self
        typeController?.tankCap = tankCap
        return typeController
    }
    
   /*
    func updatetankCap(){
        if let tankcap = tankCap{
            tankCapLabel.text = tankcap.description
        }else{
            tankCapLabel.text = "not set"
        }
    }
    func selectTankCapTVC(_ controller: SelectTankCapTVC, didSelect tankCap: TankCap) {
        self.tankCap = tankCap
        updatetankCap()
        
    }
    */
    
    
    
    
    
    
    
    
    
    
    /*
    @IBSegueAction func showSuiteTypeS(_ coder: NSCoder) -> SelectSuiteTypeTVC? {
        let typeController = SelectSuiteTypeTVC(coder: coder)
        typeController?.delegate = self
        typeController?.suiteType = suiteType
        return typeController
    }
    
    
    
    
    func updateSuiteType(){
        if let suiteType = suiteType{
            suiteTypeLabel.text = suiteType.description
        }else{
            suiteTypeLabel.text = "not set"
        }
    }
    func selectSuiteTypeTVC(_ controller: SelectSuiteTypeTVC, didSelect suiteType: SuiteType) {
        self.suiteType = suiteType
        updateSuiteType()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBSegueAction func showWeatherConditionS(_ coder: NSCoder) -> SelectWeatherConditionTVC? {
        let typeController = SelectWeatherConditionTVC(coder: coder)
        typeController?.delegate = self
        typeController?.weather = weather
        return typeController
    }
    
    
    func updateWeather(){
        if let weather = weather{
            weatherConditionLabel.text = weather.description
        }else{
            weatherConditionLabel.text = "not set"
        }
    }
    func selectWeatherConditionTVC(_ controller: SelectWeatherConditionTVC, didSelect weather: Weather) {
        self.weather = weather
        updateWeather()
    }
    
    
    
    
    
    
    
    
    
    
   

    @IBSegueAction func showSwellS(_ coder: NSCoder) -> SelectSwellTVC? {
        let typeController = SelectSwellTVC(coder: coder)
        typeController?.delegate = self
        typeController?.swell = swellLvl
        return typeController
    }
    
    
    
    func updateSwell(){
        if let swell = swellLvl{
            swellingLvlLabel.text = swell.description
        }else{
            swellingLvlLabel.text = "not set"
        }
    }
    
    func selectSwellTVC(_ controller: SelectSwellTVC, didSelect swell: Swell) {
        self.swellLvl = swell
        updateSwell()
    }
   */
}
