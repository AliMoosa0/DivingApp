//
//  HomeVC.swift
//  DivingApp
//
//  Created by ALI MOOSA on 23/12/2022.
//

import UIKit

class HomeVC: UIViewController {
var trips = [Trip]()
var dives = [Dive]()
    @IBOutlet weak var noOfTrips: UILabel!
    @IBOutlet weak var lastButton: UILabel!
    
    @IBOutlet weak var noOfDives: UILabel!
    func numberOfTrips(trips :[Trip]){
        
       let tripCount = trips.count
        
        noOfTrips.text = "Number of trips:\n\(String(tripCount))"
    }
   
    
    func avgMaxDepth(trips: [Trip], dives: [Dive]) -> Double {
        var totalDepth = 0.0
        var numDives = 0

        for trip in trips {
            for dive in trip.dives {
                totalDepth += dive.maxDepth!
                numDives += 1
            }
        }

        if numDives > 0 {
            return totalDepth / Double(numDives)
        } else {
            return 0.0
        }
    }
    
    func updatLastLabel(){
        lastButton.text = " AVG of max Depths:\n\(String(avgMaxDepth(trips: trips, dives: dives))) "
    }

   
    
    
    
    
    func numberOfDives(trips :[Trip]){
        var noDives : Int = 0
        for trip in trips {
            noDives += trip.dives.count
        }
        
        noOfDives.text = "Number of dives:\n\(String(noDives))"
    }
    
    @IBOutlet weak var maxDepthLabel: UILabel!
    
    
    
    
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trips = Trip.loadSampleLoad()
        numberOfTrips(trips: trips)
        numberOfDives(trips : trips)
        updatLastLabel()
        
    }
    


}
