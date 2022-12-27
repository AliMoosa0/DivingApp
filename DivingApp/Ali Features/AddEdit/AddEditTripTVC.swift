//
//  AddEditTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 20/12/2022.
//

import UIKit

class AddEditTableViewController: UITableViewController, UITextFieldDelegate {
    // MARK: - Form Outlits
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var locationTextField: UITextField!
    
    @IBOutlet weak var theDateLabel: UILabel!
    
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Save Button funcs
    
    var trip : Trip?
    func updateSaveButtonState(){
        let nameTxt = nameTextField.text ?? ""
        
        let locationTxt = locationTextField.text ?? ""
        
        saveButton.isEnabled = !nameTxt.isEmpty && !locationTxt.isEmpty
    }
    
    func updateTheDateLabel (date: Date){
        theDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateTheDateLabel(date: sender.date)
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
         updateSaveButtonState()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "saveUnwind" else {return}
        
        let name = nameTextField.text ?? ""
        let location = locationTextField.text ?? ""
        let date = datePicker.date
        
        
        if trip != nil {
            trip?.title = name
            trip?.location = location
            trip?.tripDate = date
        
            
        }else{
        
            trip = Trip(title: name, location: location, tripDate: date, dives: [])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
        updateSaveButtonState()
        updateTheDateLabel(date: datePicker.date)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        
        
        if let trip = trip {
            navigationItem.title = "Editing a Trip"
            nameTextField.text = trip.title
            locationTextField.text = trip.location
            theDateLabel.text = String("\(trip.tripDate)")
            
        }
        
    }
    //to hide the heyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    // to show the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return(true)
    }
    
}
