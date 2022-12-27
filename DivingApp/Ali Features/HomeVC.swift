//
//  HomeVC.swift
//  DivingApp
//
//  Created by ALI MOOSA on 23/12/2022.
//

import UIKit

class HomeVC: UIViewController {
var trips = [Trip]()
    @IBOutlet weak var noOfTrips: UILabel!
   
    @IBOutlet weak var noOfDives: UILabel!
    func numberOfTrips(trips :[Trip]){
        
       let tripCount = trips.count
        
        noOfTrips.text = "Number of trips:\n\(String(tripCount))"
    }
   
    
    
    
    
    
    func numberOfDives(trips :[Trip]){
        var noDives : Int = 0
        for trip in trips {
            noDives += trip.dives!.count
        }
        
        noOfDives.text = "Number of dives:\n\(String(noDives))"
    }
    
    @IBOutlet weak var maxDepthLabel: UILabel!
    
    
    
    
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trips = Trip.loadSampleLoad()
        numberOfTrips(trips: trips)
        numberOfDives(trips : trips)
        
        
        // Do any additional setup after loading the view.
    }
    


}
