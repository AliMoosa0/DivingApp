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
        let trip1 = Trip(title: "trip1", location: "malkia", tripDate: Date(), dives: [Dive(diveNumber: 1, surfaceInterval: 11.11, timeIn: Date.now, timeOut: Date.now, maxDepth: 50.00, avgDepth: 60.00, buttomTime: 11.11, tankType: .steel, tankCap: .twelve, airIn: 11.11, airOut: 11.11, suiteType: .onePiece, wieght: 11.11, gasMix: 11.11, computer: "Mac", camera: "canon", wetherType: .sunny, swell: .noSwell, airTemp: 11.11, waterTemp: 11.11, visibility: 1.11, notes: "arigato")])
        
        
        
        
        let trip2 = Trip(title: "trip2", location: "manama", tripDate: Date(), dives: [Dive(diveNumber: 1, surfaceInterval: 11.11, timeIn: Date.now, timeOut: Date.now, maxDepth: 50.00, avgDepth: 60.00, buttomTime: 11.11, tankType: .steel, tankCap: .twelve, airIn: 11.11, airOut: 11.11, suiteType: .onePiece, wieght: 11.11, gasMix: 11.11, computer: "Mac", camera: "canon", wetherType: .sunny, swell: .noSwell, airTemp: 11.11, waterTemp: 11.11, visibility: 1.11, notes: "arigato")])
        
        
        
        return [trip1, trip2]
    }
    
}

