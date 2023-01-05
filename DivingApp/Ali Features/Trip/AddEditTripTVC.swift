//
//  AddEditTableViewController.swift
//  DivingApp
//
//  Created by ALI MOOSA on 20/12/2022.
//

import UIKit

class AddEditTableViewController: UITableViewController, UITextFieldDelegate {
    
    
    var trip : Trip?
    // MARK: - Form Outlits
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var theDateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the name text field as the first responder
        nameTextField.becomeFirstResponder()

        // Update the state of the save button
        updateSaveButtonState()

        // Update the date label with the current date picker value
        updateTheDateLabel(date: datePicker.date)
        // update the trip
        updateTrip()
        

        // Add a tap gesture recognizer to dismiss the keyboard when the user taps on the view
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddEditTableViewController.keyboardDismiss))
        view.addGestureRecognizer(tap)
    }

    // Called when the user taps on the view to dismiss the keyboard
    @objc func keyboardDismiss() {
        view.endEditing(true)
    }

    
   
    // Updates the text fields with the values of a provided trip object
    func updateTrip() {
        if let trip = trip {
            // If a trip object is provided, populate the text fields with its values
            //and set the navigation item title to "Editing a Trip"
            navigationItem.title = "Editing a Trip"
            nameTextField.text = trip.title
            locationTextField.text = trip.location
            theDateLabel.text = String("\(trip.tripDate)")
        } else {
            // If no trip object is provided, set the navigation item title to "Adding a Trip"
            navigationItem.title = "Adding a Trip"
        }
    }

    //MARK: - Update the date
    // Updates the date label with the provided date in the "month day, year" format
    func updateTheDateLabel(date: Date) {
        theDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.defaultDigits))
    }

    // Called when the value of the date picker changes
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        // Update the date label with the new date picker value
        updateTheDateLabel(date: sender.date)
    }


    // MARK: - hide unhide the pickers
    // The index paths for the date label and date picker cells
    let DateLableCellIndexPath = IndexPath(row: 2, section: 0)
    let DatePickerCellIndexPath = IndexPath(row: 3, section: 0)

    // A flag to track the visibility of the date picker
    var isDatePickerVisible: Bool = false {
        didSet {
            // Show or hide the date picker based on the value of the flag
            datePicker.isHidden = !isDatePickerVisible
        }
    }

    // Set the height of the date picker cell to 0 if the date picker is not visible, otherwise use the default height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case DatePickerCellIndexPath where isDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }

    // Set the estimated height of the date picker cell to 190 if the date picker is visible, otherwise use the default height
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case DatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }

    // Toggle the visibility of the date picker when the user taps on the date label cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if indexPath == DateLableCellIndexPath {
            isDatePickerVisible.toggle()
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    //MARK: - save button
    
    // Called whenever the text in either of the text fields is changed
    @IBAction func textEditingChanged(_ sender: UITextField) {
        // Update the state of the save button
        updateSaveButtonState()
    }

    // Updates the state of the save button based on the current values of the text fields
    func updateSaveButtonState() {
        // Get the current value of the name text field
        let nameTxt = nameTextField.text ?? ""
        // Get the current value of the location text field
        let locationTxt = locationTextField.text ?? ""

        // Enable the save button if both the name and location text fields are not empty
        saveButton.isEnabled = !nameTxt.isEmpty && !locationTxt.isEmpty
    }
    
    // MARK: - prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check if the segue identifier is correct
        guard segue.identifier == "saveUnwind" else { return }

        // Get the values for the name, location, and date fields
        let name = nameTextField.text ?? ""
        let location = locationTextField.text ?? ""
        let date = datePicker.date

        // If a trip object exists, update its values with the new ones
       
        if trip != nil {
            trip?.title = name
            trip?.location = location
            trip?.tripDate = date
            // Otherwise, create a new trip object with the new values
        } else {
            trip = Trip(title: name, location: location, tripDate: date, dives: [])
        }
    }
    
    
    }


