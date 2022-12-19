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
   
    
    init(title: String, location: String, tripDate:Date){
        self.id = UUID()
        self.title = title
        self.location = location
        self.tripDate = tripDate
        
    }
    
    static func ==(lhs: Trip, rhs: Trip) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let archiveURL = documentsDirectory.appendingPathComponent("Trips").appendingPathExtension("Tlist")
    
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
        let trip1 = Trip(title: "trip1", location: "malkia", tripDate: Date())
        let trip2 = Trip(title: "trip2", location: "manama", tripDate: Date())
        let trip3 = Trip(title: "trop3", location: "jid ali", tripDate: Date())
        
        return [trip1, trip2, trip3]
    }
    
}

