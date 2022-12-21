//
//  Trips.swift
//  DivingApp
//
//  Created by ALI MOOSA on 15/12/2022.
//

import Foundation
struct Trip: Equatable, Codable{
    let id: UUID
    var title: String
    var location: String
    var tripDate: Date
    var dives : [Dive]?
   
    
    init(title: String, location: String, tripDate:Date, dives : [Dive]){
        self.id = UUID()
        self.title = title
        self.location = location
        self.tripDate = tripDate
        self.dives = dives
        
    }
    
    static func ==(lhs: Trip, rhs: Trip) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("Trips").appendingPathExtension("plist")
    
    static func loadTrips() -> [Trip]? {
        guard let codedTrips = try? Data(contentsOf: archiveURL) else {return nil}
        let propertListDecoder = PropertyListDecoder()
        return try? propertListDecoder.decode(Array<Trip>.self, from: codedTrips)
    }
    
    static func saveTrips(_ trips: [Trip]){
        let propertyListEncoder = PropertyListEncoder()
        let codedtrips = try? propertyListEncoder.encode(trips)
        try? codedtrips?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSampleLoad() -> [Trip]{
        let trip1 = Trip(title: "trip1", location: "malkia", tripDate: Date(), dives: [Dive(diveNumber: 1, surfaceInterval: 75.7, timeIn: Date.now, timeOut: Date.now, maxDepth: 60.6, avgDepth: 30, buttomTime: 90, isAluminium: true, isSteel: false, is10mm: true, is12mm: false, is15mm: false, airIn: 50, airOut: 10, isShortie: true, is1Piece: false, is2Piece: false, isSemiDry: false, isDrySuite: false, thickness: 8, wieght: 20, gasMix: 70, computer: "mac", camera: "cannon", isSunny: true, isClowdy: false, isWindy: false, isOvercast: false, isNoSwell: false, isModerateSwell: true, isStrongSwell: false, airTemp: 25, waterTemp: 18, visibility: 60, notes: "nice")])
        
        let trip2 = Trip(title: "trip2", location: "manama", tripDate: Date(), dives: [Dive(diveNumber: 2, surfaceInterval: 75.7, timeIn: Date.now, timeOut: Date.now, maxDepth: 60.6, avgDepth: 30, buttomTime: 90, isAluminium: true, isSteel: false, is10mm: true, is12mm: false, is15mm: false, airIn: 50, airOut: 10, isShortie: true, is1Piece: false, is2Piece: false, isSemiDry: false, isDrySuite: false, thickness: 8, wieght: 20, gasMix: 70, computer: "mac", camera: "cannon", isSunny: true, isClowdy: false, isWindy: false, isOvercast: false, isNoSwell: false, isModerateSwell: true, isStrongSwell: false, airTemp: 25, waterTemp: 18, visibility: 60, notes: "nice")])
       
        
        
        return [trip1, trip2]
    }
    
}

struct Dive : Equatable, Codable{
    var diveNumber : Int
    
    var surfaceInterval : Double
    var timeIn : Date
    var timeOut : Date
    
    var maxDepth : Double
    var avgDepth : Double
    var buttomTime : Double
    
    var isAluminium : Bool
    var isSteel : Bool
    
    var is10mm : Bool
    var is12mm : Bool
    var is15mm : Bool
    
    var airIn : Double
    var airOut : Double
    
    
    var isShortie : Bool
    var is1Piece : Bool
    var is2Piece : Bool
    var isSemiDry : Bool
    var isDrySuite : Bool
    var thickness : Int
    
    var wieght : Double
    var gasMix : Double
    var computer : String
    var camera : String
    
    
    var isSunny : Bool
    var isClowdy : Bool
    var isWindy : Bool
    var isOvercast : Bool
    
    
    var isNoSwell : Bool
    var isModerateSwell : Bool
    var isStrongSwell : Bool
    
    
    var airTemp : Double
    var waterTemp : Double
    var visibility : Int
    
    
    var notes : String
    
    
    
    
    
}
