//
//  AddEditDivesTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 21/12/2022.
//

import UIKit


class AddEditDivesTableViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    
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
    @IBOutlet weak var airInTF: UITextField!
    @IBOutlet weak var airOutTF: UITextField!
    @IBOutlet weak var wieghtTF: UITextField!
    @IBOutlet weak var gassMixTF: UITextField!
    @IBOutlet weak var computerTF: UITextField!
    @IBOutlet weak var cameraTF: UITextField!
    @IBOutlet weak var weatherTempTF: UITextField!
    @IBOutlet weak var airTempTF: UITextField!
    @IBOutlet weak var visibilyTF: UITextField!
    @IBOutlet weak var notesTF: UITextField!
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
     //when opening the addEdit dive page make the keyboard appear on the number of dives text field
        //FIX THIS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        //need to rename it form label to text field
        numOfDivesLabel.becomeFirstResponder()
        
        //calling the methods
        updateDive()
        updatePlaceHolders()
        
        
        // Set up the picker views
        //assign the input view to the picker view
        //adding the done button to each picker view
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
        
        
        // Add a tap gesture recognizer to the view
        // to dismiss the keyboard when the view is tapped
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddEditDivesTableViewController.keyboardDismiss))
        view.addGestureRecognizer(tap)
    }
    
    @objc func keyboardDismiss() {
        // End editing when the view is tapped
        // to dismiss the keyboard
        view.endEditing(true)
    }

  
    // MARK: - toolBar
    
    // Toolbar with a done button
    @IBOutlet var toolBar: UIToolbar!

    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        // Dismiss the keyboard when the done button is tapped
        slectedTankType.resignFirstResponder()
        slectedtankcap.resignFirstResponder()
        slectedSuiteType.resignFirstResponder()
        slectedWeather.resignFirstResponder()
        slectedSwell.resignFirstResponder()
    }

    
    //MARK:  - selections on the picker views
    
    // the selection text fields outlet
    @IBOutlet weak var slectedTankType: UITextField!
    @IBOutlet weak var slectedtankcap: UITextField!
    @IBOutlet weak var slectedSuiteType: UITextField!
    @IBOutlet weak var slectedWeather: UITextField!
    @IBOutlet weak var slectedSwell: UITextField!
    
    
    // arrays of the selections
    let arrTanktype = ["Aluminuim", "Steel" ]
    let arrTankcap = ["10", "12", "15" ]
    let arrSuiteType = ["Shortie", "One Piece", "Two Piece", "semi Dry", "Dry Suite" ]
    let arrWeather = [" Sunny", "Clowdy", "Windy", "Overcast" ]
    let arrSwell = ["No Swell", "Moderate Swell", "Strong Swell"]
   
    
    // function to update the place holders of the text feilds
    func updatePlaceHolders(){
    slectedTankType.placeholder = "select a tank type"
    slectedtankcap.placeholder = "select a tank cap"
    slectedSuiteType.placeholder = "select a Suite type"
    slectedWeather.placeholder = "select a weather condition"
    slectedSwell.placeholder = "select a swell level"
    }
    //declaring the picker views
    var tankTypePickerView = UIPickerView()
    var tankCapPickerView = UIPickerView()
    var suiteTypePickerView = UIPickerView()
    var weatherPickerView = UIPickerView()
    var swellPickerView = UIPickerView()

    //the number of compunents for each picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
           return 1
       }

       //to ditemin the number of rows for each pciker
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
    
        //add the array components to the rows
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
       // whn the user select an option add the selected option to the text field
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
    // funxtion to updatge the dive
    func updateDive(){
        //if the dive exist
        if let dive = dive {
            //set the title to editing dive
            navigationItem.title = "Editing the Dive"
            //set each dive component to their text fields and pickers
            numOfDivesLabel.text = String("\(dive.diveNumber!)")
            surfaceIntervalTF.text = String("\(dive.surfaceInterval!)")
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
            //else set the title to a new dive
            navigationItem.title = "New Dive"
        }
    }
    //MARK: - Prepare
    var dive: Dive?
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveDiveUnwind" else {return}
        //declare and assign vairiables to the textfields and pickers
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
        
        
        //declaring a new variables and assigning them to the array row
        let tankType = arrTanktype[tankTypeSelectedRow]
        let tankCap = arrTankcap[tankCapSelectedRow]
        let suiteType = arrSuiteType[suiteTypeSelectedRow]
        let weatherType = arrWeather[weatherSelectedRow]
        let swell = arrSwell[swellSelectedRow]
        
        // Dive is not nil, so we can safely access its properties and methods
        if dive != nil {
           
            print("updating the dive")
            
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
            dive?.wetherType = weatherType
            dive?.waterTemp = weatherTemp
            dive?.airTemp = airTemp
            dive?.visibility = visibility
            dive?.swell = swell
            dive?.notes = notes
            } else {
           
            
            // Dive is nil, so we need to create a new dive object
              

               dive = Dive(id: UUID(), diveNumber: noOfDives, surfaceInterval: surfaceIntreval, timeIn: timeInThePicker, timeOut: timeOutThePicker, maxDepth: maxDepth, avgDepth: avgDepth, buttomTime: bottomTime, tankType: tankType, tankCap: tankCap, airIn: airIn, airOut: airOut, suiteType: suiteType, wieght: weight, gasMix: gasMix, computer: computer, camera: camera, wetherType: weatherType, swell: swell, airTemp: airTemp, waterTemp: weatherTemp, visibility: visibility, notes: notes)
           }

    }
    
    //MARK: - Update the date
    
    func updateDateViews() {
        // Get the current calendar
        let calendar = Calendar.current
        // Create a date component for one minute interval
        let oneMinuteInterval = DateComponents(minute: 1)
        // Add the one minute interval to the time in the timeInPicker
        let minimumTime = calendar.date(byAdding: oneMinuteInterval, to: timeInPicker.date)
        // Set the minimum time for the timeOutPicker
        timeOutPicker.minimumDate = minimumTime

        // Get the hour and minute components from the timeInPicker
        let timeInComponents = calendar.dateComponents([.hour, .minute], from: timeInPicker.date)
        let hourIn = timeInComponents.hour!
        let minuteIn = timeInComponents.minute!

        // Get the hour and minute components from the timeOutPicker
        let timeOutComponents = calendar.dateComponents([.hour, .minute], from: timeOutPicker.date)
        let hourOut = timeOutComponents.hour!
        let minuteOut = timeOutComponents.minute!

        // Format the time in string in AM/PM format
        let timeInString: String
        if hourIn > 12 {
            timeInString = String(format: "%02d:%02d PM", hourIn - 12, minuteIn)
        } else {
            timeInString = String(format: "%02d:%02d AM", hourIn, minuteIn)
        }

        // Format the time out string in AM/PM format
        let timeOutString: String
        if hourOut > 12 {
            timeOutString = String(format: "%02d:%02d PM", hourOut - 12, minuteOut)
        } else {
            timeOutString = String(format: "%02d:%02d AM", hourOut, minuteOut)
        }

        // Update the time in and time out labels with the formatted strings
        timeInLabel.text = timeInString
        timeOutLabel.text = timeOutString
    }


    //when a pciker is changed call the updateDateView method
    @IBAction func pickerValueChanged(_ sender: Any) {
        updateDateViews()
    }
    
    // MARK: - hide unhide the pickers a
    // Index path for the time in label cell
    let timeInCellIndexPath = IndexPath(row: 1, section: 1)
    // Index path for the time in picker cell
    let timeInPickerCellIndexPath = IndexPath(row: 2, section: 1)

    // Index path for the time out label cell
    let timeOutLableCellIndexPath = IndexPath(row: 3, section: 1)
    // Index path for the time out picker cell
    let timeoutPickerCellIndexPath = IndexPath(row: 4, section: 1)

    
    // Flag to determine if the time in picker is visible
    var isTimeInPickerVisible: Bool = false {
        didSet {
            // Toggle the visibility of the time in picker
            timeInPicker.isHidden = !isTimeInPickerVisible
        }
    }
    // Flag to determine if the time out picker is visible
    var isTimeOutPickerVisible: Bool = false {
        didSet {
            // Toggle the visibility of the time out picker
            timeInPicker.isHidden = !isTimeOutPickerVisible
        }
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Determine the height of the cell based on its index path and the current visibility of the time pickers
        switch indexPath {
            // If the time in picker is not visible and the current index path is for the time in picker cell
            case timeInPickerCellIndexPath where isTimeInPickerVisible == false:
            // Return a height of 0 for the cell
                return 0
            
            // If the time out picker is not visible and the current index path is for the time out picker cell
            case timeoutPickerCellIndexPath where isTimeOutPickerVisible == false:
            // Return a height of 0 for the cell
                return 0
            
            // For all other cells
            default:
            // Return the automatic dimension for the cell
                return UITableView.automaticDimension // Return the automatic dimension for the cell
        }
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Determine the estimated height of the cell based on its index path
        switch indexPath {
            
            // If the current index path is for the time in picker cell
            case timeInPickerCellIndexPath:
            // Return a height of 190 for the cell
               return 190
            
            // If the current index path is for the time out picker cell
        case timeoutPickerCellIndexPath:
            // Return a height of 190 for the cell
                return 190
           
            // For all other cells
        default:
            // Return the automatic dimension for the cell
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
    
}

