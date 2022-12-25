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
        
       var tripCount = trips.count
        
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
    
    
    
    
    
    
    
    
    /*
    func maxDepthDives(trips: [[Dive]]) -> [Dive] {
        let dives = trips.flatMap { trip in
            trip
        }
        let maxDepth = dives.max { a, b in
            a.maxDepth ?? 0.00< b.maxDepth ?? 0.00
        }
        return maxDepth.map { [$0] } ?? []
    }

*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trips = Trip.loadSampleLoad()
        numberOfTrips(trips: trips)
        numberOfDives(trips : trips)
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
