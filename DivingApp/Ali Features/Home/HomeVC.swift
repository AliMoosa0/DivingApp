//
//  HomeVC.swift
//  DivingApp
//
//  Created by ALI MOOSA on 23/12/2022.
//

import UIKit

class HomeVC: UIViewController {
    // trips is an array of Trip objects
    var trips = [Trip]()

    // dives is an array of Dive objects
    var dives = [Dive]()

    // calling the outlets
    @IBOutlet weak var noOfTrips: UILabel!
    @IBOutlet weak var noOfDives: UILabel!
    @IBOutlet weak var maxDepthLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // load sample trips or load trips from file and assign them to the trips array
        if let savedTrips = Trip.loadTrips(){
            trips = savedTrips
        }else{
            trips = Trip.loadSampleLoad()
        }
        
        // load dives
        
        if let savedDives = Dive.loadAllDives(){
            dives = savedDives
        }
         

        // updates all the labels
        refreshData()
        
    }
     

    // updates the noOfTrips label with the number of trips
    func numberOfTrips(trips :[Trip]){
        // trip count
        let tripCount = trips.count

        // update the noOfTrips label
        noOfTrips.text = "Number of trips:\n\(String(tripCount))"
    }

    // calculates the average maximum depth of all dives
    func avgMaxDepth(dives: [Dive]) -> String {
        // total depth of all dives
        var totalDepth = 0.0

        // number of dives
        var numDives = 0

        // iterate through each trip and dive, adding the maximum depth of each dive to totalDepth
        
            for dive in dives {
                totalDepth += dive.maxDepth ?? 0.0
                numDives += 1
            }
        

        // if there are dives, return the average maximum depth
        if numDives > 0 {
            //return totalDepth / Double(numDives)
            return String(format: "%.2f", totalDepth / Double(numDives))
        }
        // if there are no dives, return 0
        else {
            return "0.00"
        }
    }

    // updates the maxDepthLabel with the average maximum depth of all dives
    func updatLastLabel(){
        // update the maxDepthLabel
        maxDepthLabel.text = " AVG of max Depths:\n\(String(avgMaxDepth(dives: dives))) "
    }

    // updates the noOfDives label with the number of dives in the trips array
    func numberOfDives(dives :[Dive]){
        
        let noDives = dives.count

        // update the noOfDives label
        noOfDives.text = "Number of dives:\n\(noDives)"
    }
    
    func updateNoOfTrips(){
        // update the number of trips
        numberOfTrips(trips: trips)

    }
    
    func updateNoOfDives(){
        // update the number of dives
        numberOfDives(dives: dives)
    }
    
    
    func refreshData(){
        updateNoOfTrips()
        updateNoOfDives()
        updatLastLabel()
    }
}
