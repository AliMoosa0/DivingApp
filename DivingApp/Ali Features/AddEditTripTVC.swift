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
