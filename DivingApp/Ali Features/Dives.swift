//
//  Dive.swift
//  DivingApp
//
//  Created by ALI MOOSA on 24/12/2022.
//

import Foundation
// Struct representing a dive, with properties for storing information about the dive
// and conforming to the Equatable and Codable protocols
struct Dive : Equatable, Codable {
    
    // Unique identifier for the dive
    var id = UUID()
    
    // Dive number
    var diveNumber : Int
    
    // Surface interval in hours
    var surfaceInterval : Double?
    
    // Time that the diver entered the water
    var timeIn : Date?
    
    // Time that the diver exited the water
    var timeOut : Date?
    
    // Maximum depth reached during the dive
    var maxDepth : Double?
    
    // Average depth during the dive
    var avgDepth : Double?
    
    // Bottom time of the dive in minutes
    var buttomTime : Double?
    
    // Type of tank used during the dive
    var tankType : String?
   
    // Capacity of the tank in liters
    var tankCap :  String?
    
    // Amount of air in the tank at the beginning of the dive in bar
    var airIn : Double?
    
    // Amount of air in the tank at the end of the dive in bar
    var airOut : Double?
    
    // Type of diving suit worn during the dive
    var suiteType :  String?
   
    // Weight of the diver in kilograms
    var wieght : Double?
    
    // Gas mix used during the dive, as a percentage of oxygen
    var gasMix : Double?
    
    // Type of diving computer used during the dive
    var computer : String?
    
    // Type of camera used during the dive
    var camera : String?
    
    // Weather conditions during the dive
    var wetherType : String?
    
    // Swell conditions during the dive
    var swell :  String?
    
    // Air temperature during the dive in Celsius
    var airTemp : Double?
    
    // Water temperature during the dive in Celsius
    var waterTemp : Double?
    
    // Visibility during the dive in meters
    var visibility : Double?
    
    // Notes about the dive
    var notes : String?
    
    // Static function for comparing two Dive instances
    static func ==(lhs: Dive, rhs: Dive) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
  //  static let archiveURL = documentsDirectory.appendingPathComponent("dives").appendingPathExtension("plist")
    
    static func getFileUrl(_ tripUID : String) -> URL{
        let archiveURL = documentsDirectory.appendingPathComponent(tripUID).appendingPathExtension("plist")
        return archiveURL
    }
    
    static func loadDives(from tripUID: String) -> [Dive]? {
        let archiveURL = getFileUrl(tripUID)
        guard let codedDives = try? Data(contentsOf: archiveURL) else {return nil}
        let propertListDecoder = PropertyListDecoder()
        return try? propertListDecoder.decode(Array<Dive>.self, from: codedDives)
    }
    
    static func saveDives(_ dives: [Dive], to tripUID: String){
        let archiveURL = getFileUrl(tripUID)
        let propertyListEncoder = PropertyListEncoder()
        let codedDives = try? propertyListEncoder.encode(dives)
        try? codedDives?.write(to: archiveURL, options: .noFileProtection)
    }
    
    
    static let archiveURL = documentsDirectory.appendingPathComponent("dives").appendingPathExtension("plist")
    
    static func loadAllDives() -> [Dive]?{
        //let archiveURL = documentsDirectory.appendingPathComponent("dives").appendingPathExtension("plist")
        
        guard let codedDives = try? Data(contentsOf: archiveURL) else {return nil}
        let propertListDecoder = PropertyListDecoder()
        return try? propertListDecoder.decode(Array<Dive>.self, from: codedDives)
    }
    
    static func saveAllDives(_ dives: [Dive]){
       // let archiveURL = documentsDirectory.appendingPathComponent("dives").appendingPathExtension("plist")
        
        let propertyListEncoder = PropertyListEncoder()
        let codedDives = try? propertyListEncoder.encode(dives)
        try? codedDives?.write(to: archiveURL, options: .noFileProtection)
    }
    
}
