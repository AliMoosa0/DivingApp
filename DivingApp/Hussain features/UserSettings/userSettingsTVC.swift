//
//  userSettingsTVC.swift
//  DivingApp
//
//  Created by Hussain ali on 30/12/2022.
//

import UIKit
import MessageUI



class userSettingsTVC: UITableViewController, MFMailComposeViewControllerDelegate,UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    
    let defaults = UserDefaults()
    
    func saving() {
        // Save values to UserDefaults
        defaults.setValue(NameTxt.text, forKey: "Name")
        if let image = imageView.image {
            if let imageData = image.pngData() {
                defaults.set(imageData, forKey: "Picture")
               
            }
        }
    
        defaults.setValue(bioTxt.text, forKey: "Bio")

        NameTxt.resignFirstResponder()
    }
   





    
    @IBAction func Notif(_ sender: UISwitch) {
        if sender.isOn {
            UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
                if granted{
                    print("granted")
                    self.scheduleNotif()
                } else {
                    print("denied")
                }
            }
        } else {
            // Remove notification request from the notification center
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["diving_reminder"])
        }
    }

    func scheduleNotif() {
        let content = UNMutableNotificationContent(
        )
        content.title = "Diving App"
        content.body = "It's time to log your dive!"
        content.sound = .default
        content.badge = 0
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 7, repeats: false)
       
        let request = UNNotificationRequest(identifier: "diving_reminder", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { (error) in

        }
    }
    
    
    @IBOutlet weak var NameTxt: UITextField!
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(rightBtn))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBtn))
    }
    var input : String?
    
    @IBOutlet weak var bioTxt: UITextField!
    var bio : String?
    
    
    
    @objc func rightBtn(){
        saving()
        input = NameTxt.text
        bio = bioTxt.text
        // Dismiss the cursor
          NameTxt.resignFirstResponder()
        bioTxt.resignFirstResponder()

          // Hide the "Done" button
          self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
        
    }
    @objc func leftBtn(){
        NameTxt.text = input
        bioTxt.text = bio
        NameTxt.resignFirstResponder()
        bioTxt.resignFirstResponder()
        // Hide the "Done" button
        self.navigationItem.rightBarButtonItem = nil
      self.navigationItem.leftBarButtonItem = nil
        
        
    }
    
    @IBAction func ShareBtn(_ sender: Any) {
        
        // Create an array of items to share
        let itemsToShare = ["Check out this great Diving app!", URL(string: "https://itunes.apple.com/app/polytechnic.bh.DivingApp") ?? ""] as [Any]
           
           // Create the activity view controller
           let activityViewController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
           
           // Present the activity view controller
           present(activityViewController, animated: true, completion: nil)
        
    }
    
    
    
    
   

     func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // Dismiss the mail composer
        controller.dismiss(animated: true, completion: nil)
    }

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
    
    
    
    @IBAction func emailBtn(_ sender: Any) {
        
            // Check if the device is able to send emails
            guard MFMailComposeViewController.canSendMail() else {
                // Display an alert if the device cannot send emails
                let alert = UIAlertController(title: "Error", message: "This device is not able to send emails. Please set up an email account in order to send an email.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
                return
            }

            // Create and configure the mail composer
            let mailComposter = MFMailComposeViewController()
            mailComposter.mailComposeDelegate = self
            mailComposter.setToRecipients(["diveApp@gmail.com"])
            mailComposter.setSubject("Enter your subjet")
            mailComposter.setMessageBody("type your message", isHTML: false)

            // Add the image as an attachment to the email, if it exists
        if let image = imageView.image, let jpegData = image.jpegData(compressionQuality: 0.9) {
            mailComposter.addAttachmentData(jpegData, mimeType: "image/jpeg", fileName: "photo.jpg")
        }


            // Present the mail composer
            present(mailComposter, animated: true, completion: nil)
        }


    
    
    
    @IBAction func referralCodeButtonTapped(_ sender: Any) {
        
    }
    
    
    
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameTxt.delegate = self
        bioTxt.delegate = self

        // Retrieve saved values
        NameTxt.text = defaults.value(forKey: "Name") as? String
        bioTxt.text = defaults.value(forKey: "Bio") as? String
        if let imageData = defaults.data(forKey: "Picture") {
            imageView.image = UIImage(data: imageData)
        }
    }

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


