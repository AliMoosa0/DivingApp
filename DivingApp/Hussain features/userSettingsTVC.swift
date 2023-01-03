//
//  userSettingsTVC.swift
//  DivingApp
//
//  Created by Hussain ali on 30/12/2022.
//

import UIKit

class userSettingsTVC: UITableViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
   

    
    var dive = Dive(id: UUID(), diveNumber: 0, surfaceInterval: 0.0, timeIn: Date(), timeOut: Date(), maxDepth: 0.0, avgDepth: 0.0, buttomTime: 0.0, tankType: .none, tankCap: .none, airIn: 0.0, airOut: 0.0, suiteType: .none, wieght: 0.0, gasMix: 0.0, computer: "", camera: "", wetherType: .none, swell: .none, airTemp: 0.0, waterTemp: 0.0, visibility: 0.0, notes: "")

    
    
    
    @IBAction func ChangeBtn(_ sender: Any) {

        let imagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        
        present(imagePickerController, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true, completion: nil)
        
            guard let selectedImage = info[.originalImage] as? UIImage else {
                return
            }
            
            imageView.image = selectedImage
    }
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    
    /*
   
    @IBAction func WeightSwitch(_ sender: Any) {
        let weightString = WeightLbl.text!
           let weight = Double(weightString)!
           
           if let switchControl = sender as? UISwitch {
               if switchControl.isOn {
                   let pounds = weight * 2.205
                   WeightLbl.text = String(pounds)
               } else {
                   let kilograms = weight / 2.205
                   WeightLbl.text = String(kilograms)
               }
           }
    }
    
    
    @IBAction func TempSwitch(_ sender: Any) {
        let temp = dive.waterTemp
        if let switchControl = sender as? UISwitch {
            if switchControl.isOn {
                let fahrenheit = (temp! * 9/5) + 32
                WaterTempLbl.text = String(fahrenheit)
            } else {
                let celsius = (temp! - 32) * 5/9
                WaterTempLbl.text = String(celsius)
            }
        }
        
    }
    
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    
    
    
    
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
