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

class AddEditDivesTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    
   
   
    
    
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
  //  @IBOutlet weak var tankTypeLabel: UILabel!
    
    

    
    
    
    
    //MARK: -
    
   
   // @IBOutlet weak var tankCapLabel: UILabel!
    
    
    
    //MARK: -
    
    
    
    
    
    
    @IBOutlet weak var airInTF: UITextField!
    
    @IBOutlet weak var airOutTF: UITextField!
    
    //MARK: -
    
 //   @IBOutlet weak var suiteTypeLabel: UILabel!
    
    
    
   
    
    //MARK: -
    
    
    
    
    
    
    @IBOutlet weak var wieghtTF: UITextField!
    
    @IBOutlet weak var gassMixTF: UITextField!
    
    @IBOutlet weak var computerTF: UITextField!
    
    @IBOutlet weak var cameraTF: UITextField!
    
    //MARK: -

    
   // @IBOutlet weak var weatherConditionLabel: UILabel!
    
    @IBOutlet weak var weatherTempTF: UITextField!
    
    @IBOutlet weak var airTempTF: UITextField!
    
    @IBOutlet weak var visibilyTF: UITextField!
    
    
    //MARK: -

    
    
 //   @IBOutlet weak var swellingLvlLabel: UILabel!
    
    
   
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        print(tankTypePickerView.selectedRow(inComponent: 0))
        updateDive()
       // updatetankType()
       // updatetankCap()
       // updateWeather()
       // updateSwell()
        //updateSuiteType()
        slectedTankType.inputView = tankTypePickerView
        slectedtankcap.inputView = tankCapPickerView
        slectedSuiteType.inputView = suiteTypePickerView
        slectedWeather.inputView = weatherPickerView
        slectedSwell.inputView = swellPickerView

        // Set up the picker views
            tankTypePickerView.dataSource = self
            tankTypePickerView.delegate = self
            slectedTankType.inputView = tankTypePickerView
            slectedTankType.inputAccessoryView = toolBar

            tankCapPickerView.dataSource = self
            tankCapPickerView.delegate = self
            slectedtankcap.inputView = tankCapPickerView
            slectedtankcap.inputAccessoryView = toolBar

            suiteTypePickerView.dataSource = self
            suiteTypePickerView.delegate = self
            slectedSuiteType.inputView = suiteTypePickerView
            slectedSuiteType.inputAccessoryView = toolBar

            weatherPickerView.dataSource = self
            weatherPickerView.delegate = self
            slectedWeather.inputView = weatherPickerView
            slectedWeather.inputAccessoryView = toolBar

            swellPickerView.dataSource = self
            swellPickerView.delegate = self
            slectedSwell.inputView = swellPickerView
            slectedSwell.inputAccessoryView = toolBar
        
        updatePlaceHolders()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
       // to dissmiss the keyboard
       // let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
      //  view.addGestureRecognizer(tapGesture)
        

        
        
       
    }
  //  @objc func handleTap(_ sender: UITapGestureRecognizer) {
    //    view.endEditing(true)
   // }
   /*
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
*/
    
    
    
   
    @IBOutlet weak var notesTF: UITextField!
    
    
    
    // MARK: - functions and methods
  //  var tankType : TankType?
   // var tankCap :TankCap?
   // var suiteType : SuiteType?
  //  var weather : Weather?
  //  var swellLvl : Swell?
    // MARK: - adding a done button to the pickerView
    @IBOutlet var toolBar: UIToolbar!
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        
        slectedTankType.resignFirstResponder()
        slectedtankcap.resignFirstResponder()
        slectedSuiteType.resignFirstResponder()
        slectedWeather.resignFirstResponder()
        slectedSwell.resignFirstResponder()

    }
    
    //MARK:  - selections on the picker views
    @IBOutlet weak var slectedTankType: UITextField!
    @IBOutlet weak var slectedtankcap: UITextField!
    @IBOutlet weak var slectedSuiteType: UITextField!
    @IBOutlet weak var slectedWeather: UITextField!
    @IBOutlet weak var slectedSwell: UITextField!
    
    
    
    let arrTanktype = ["Aluminuim", "Steel" ]
    let arrTankcap = ["10", "12", "15" ]
    let arrSuiteType = ["Shortie", "One Piece", "Two Piece", "semi Dry", "Dry Suite" ]
    let arrWeather = [" Sunny", "Clowdy", "Windy", "Overcast" ]
    
    
    let arrSwell = ["No Swell", "Moderate Swell", "Strong Swell"]
    func updatePlaceHolders(){
    slectedTankType.placeholder = "select a tank type"
    slectedtankcap.placeholder = "select a tank type"
    slectedSuiteType.placeholder = "select a tank type"
    slectedWeather.placeholder = "select a tank type"
    slectedSwell.placeholder = "select a tank type"
    }
    
    var tankTypePickerView = UIPickerView()
    var tankCapPickerView = UIPickerView()
    var suiteTypePickerView = UIPickerView()
    var weatherPickerView = UIPickerView()
    var swellPickerView = UIPickerView()

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
           if pickerView == tankTypePickerView {
               return arrTanktype.count
           } else if pickerView == tankCapPickerView {
               return arrTankcap.count
           } else if pickerView == suiteTypePickerView {
               return arrSuiteType.count
           } else if pickerView == weatherPickerView {
               return arrWeather.count
           } else if pickerView == swellPickerView {
               return arrSwell.count
           }
           return 0
       }

       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           if pickerView == tankTypePickerView {
               return arrTanktype[row]
           } else if pickerView == tankCapPickerView {
               return arrTankcap[row]
           } else if pickerView == suiteTypePickerView {
               return arrSuiteType[row]
           } else if pickerView == weatherPickerView {
               return arrWeather[row]
           } else if pickerView == swellPickerView {
               return arrSwell[row]
           }
           return nil
       }

       func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
           if pickerView == tankTypePickerView {
               // Update the selected tank type here
               slectedTankType.text = arrTanktype[row]
           }
           else if pickerView == tankCapPickerView {
               // Update the selected tank capacity here
               slectedtankcap.text = arrTankcap[row]
           }
           else if pickerView == suiteTypePickerView {
               
               // Update the selected suite type here
               slectedSuiteType.text = arrSuiteType[row]
           }
           else if pickerView == weatherPickerView {
               
               // Update the selected weather here
               slectedWeather.text = arrWeather[row]
           }
           else if pickerView == swellPickerView {
               
               // Update the selected swell here
               slectedSwell.text = arrSwell[row]
           }
       }
    
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
            
            slectedTankType.text = dive.tankType
            slectedtankcap.text = dive.tankCap
            
            airInTF.text = String("\(dive.airIn!)")
            airOutTF.text = String("\(dive.airOut!)")
            
            slectedSuiteType.text = dive.suiteType
            
            wieghtTF.text = String("\(dive.wieght!)")
            gassMixTF.text = String("\(dive.gasMix!)")
            computerTF.text = String("\(dive.computer!)")
            weatherTempTF.text = String("\(dive.waterTemp!)")
            cameraTF.text = String("\(dive.camera!)")
            
            
            
            
            
         
            
            slectedWeather.text = dive.wetherType
            
            airTempTF.text = String("\(dive.airTemp!)")
            visibilyTF.text = String("\(dive.visibility!)")
            slectedSwell.text = dive.swell
            notesTF.text = String("\(dive.notes!)")
            
        }else{
            navigationItem.title = "New Dive"
        }
    }
    //MARK: - Prepare
    var dive: Dive?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveDiveUnwind" else {return}
        
        let noOfDives = Int(numOfDivesLabel.text!)
        let surfaceIntreval = Double(surfaceIntervalTF.text!)
        let timeInThePicker = timeInPicker.date
        let timeOutThePicker = timeOutPicker.date
        let maxDepth = Double(macDepthTF.text!)
        let avgDepth = Double(avgDepthTF.text!)
        let bottomTime = Double(bottomTimeTF.text!)
        let tankTypeSelectedRow = tankTypePickerView.selectedRow(inComponent: 0)
        let tankCapSelectedRow = tankCapPickerView.selectedRow(inComponent: 0)
        let airIn = Double(airInTF.text!)
        let airOut = Double(airOutTF.text!)
        let suiteTypeSelectedRow = suiteTypePickerView.selectedRow(inComponent: 0)
        let weight = Double(wieghtTF.text!)
        let gasMix = Double(gassMixTF.text!)
        let computer = computerTF.text!
        let camera = cameraTF.text!
        let weatherSelectedRow = weatherPickerView.selectedRow(inComponent: 0)
        let weatherTemp = Double(weatherTempTF.text!)
        let airTemp = Double(airTempTF.text!)
        let visibility = Double(visibilyTF.text!)
        let swellSelectedRow = swellPickerView.selectedRow(inComponent: 0)
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
            dive?.tankType = String("\(tankTypeSelectedRow)")
            dive?.tankCap =  String("\(tankCapSelectedRow)")
            dive?.airIn = airIn
            dive?.airOut = airOut
            dive?.suiteType = String("\(String(suiteTypeSelectedRow))")
            dive?.wieght = weight
            dive?.gasMix = gasMix
            dive?.computer = computer
            dive?.camera = camera
            dive?.wetherType = String("\(weatherSelectedRow)")
            dive?.waterTemp = weatherTemp
            dive?.airTemp = airTemp
            dive?.visibility = visibility
            dive?.swell = String("\(swellSelectedRow)")
            dive?.notes = notes
            
           
        } else {
            // Dive is nil, so we need to create a new dive object
               let tankType = arrTanktype[tankTypeSelectedRow]
               let tankCap = arrTankcap[tankCapSelectedRow]
               let suiteType = arrSuiteType[suiteTypeSelectedRow]
               let weatherType = arrWeather[weatherSelectedRow]
               let swell = arrSwell[swellSelectedRow]

               dive = Dive(id: UUID(), diveNumber: noOfDives, surfaceInterval: surfaceIntreval, timeIn: timeInThePicker, timeOut: timeOutThePicker, maxDepth: maxDepth, avgDepth: avgDepth, buttomTime: bottomTime, tankType: tankType, tankCap: tankCap, airIn: airIn, airOut: airOut, suiteType: suiteType, wieght: weight, gasMix: gasMix, computer: computer, camera: camera, wetherType: weatherType, swell: swell, airTemp: airTemp, waterTemp: weatherTemp, visibility: visibility, notes: notes)
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
    /*
    
    
    
    
    
    @IBSegueAction func showTankCapS(_ coder: NSCoder) -> SelectTankCapTVC? {
        let typeController = SelectTankCapTVC(coder: coder)
       // typeController?.delegate = self
        typeController?.tankCap = tankCap
        return typeController
    }
    
   
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
    
    
    
    
    
    
    
    
    
    
    
    
    @IBSegueAction func showSuiteTypeS(_ coder: NSCoder) -> SelectSuiteTypeTVC? {
        let typeController = SelectSuiteTypeTVC(coder: coder)
        typeController?.delegate = self
        typeController?.suiteType = suiteType
        return typeController

    
    
    
    
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
     */
}

