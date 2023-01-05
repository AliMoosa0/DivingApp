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

        // load sample trips and assign them to the trips array
        trips = Trip.loadSampleLoad()

        // update the number of trips label
        numberOfTrips(trips: trips)

        // update the number of dives label
        numberOfDives(trips: trips)

        // update the average maximum depth label
        updatLastLabel()
    }

    // updates the noOfTrips label with the number of trips
    func numberOfTrips(trips :[Trip]){
        // trip count
        let tripCount = trips.count

        // update the noOfTrips label
        noOfTrips.text = "Number of trips:\n\(String(tripCount))"
    }

    // calculates the average maximum depth of all dives
    func avgMaxDepth(trips: [Trip], dives: [Dive]) -> Double {
        // total depth of all dives
        var totalDepth = 0.0

        // number of dives
        var numDives = 0

        // iterate through each trip and dive, adding the maximum depth of each dive to totalDepth
        for trip in trips {
            for dive in trip.dives {
                totalDepth += dive.maxDepth!
                numDives += 1
            }
        }

        // if there are dives, return the average maximum depth
        if numDives > 0 {
            return totalDepth / Double(numDives)
        }
        // if there are no dives, return 0
        else {
            return 0.0
        }
    }

    // updates the maxDepthLabel with the average maximum depth of all dives
    func updatLastLabel(){
        // update the maxDepthLabel
        maxDepthLabel.text = " AVG of max Depths:\n\(String(avgMaxDepth(trips: trips, dives: dives))) "
    }

    // updates the noOfDives label with the number of dives in the trips array
    func numberOfDives(trips :[Trip]){
        // number of dives
        var noDives : Int = 0

        // iterate through each trip and add the number of dives in each trip to noDives
        for trip in trips {
            noDives += trip.dives.count
        }

        // update the noOfDives label
        noOfDives.text = "Number of dives:\n\(String(noDives))"
    }

}
