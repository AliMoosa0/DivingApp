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
    var diveNumber : Int?
    
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
}
//MARK: - Tank Cap
enum TankCap: CaseIterable, CustomStringConvertible, Codable {
    case ten
    case twelve
    case fifteen
    
    var description: String {
        switch self {
        case .ten:
            return "10"
        case .twelve:
            return "12"
        case .fifteen:
            return "15"
        }
    }
}
extension TankCap {
    enum Discriminator: String, Decodable {
        case ten, twelve, fifteen
    }
    
    enum CodingKeys: String, CodingKey {
        case discriminator
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(Discriminator.self, forKey: .discriminator)
        switch discriminator {
        case .ten:
            self = .ten
        case .twelve:
            self = .twelve
        case .fifteen:
            self = .fifteen
        
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
                switch self {
                case .ten:
                    try container.encode(0, forKey: .discriminator)
                case .twelve:
                    try container.encode(1, forKey: .discriminator)
                case .fifteen:
                    try container.encode(2, forKey: .discriminator)
               
                }
    }
}

//MARK: - Tank Type



enum TankType: CaseIterable, CustomStringConvertible, Codable {
    case steel
    case aluminuim
    
    
    var description: String {
        switch self {
        case .steel:
            return "steel"
        case .aluminuim:
            return "aluminuim"
        
        }
    }
}

extension TankType {
    enum Discriminator: String, Decodable {
        case steel, aluminuim
    }
    
    enum CodingKeys: String, CodingKey {
        case discriminator
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(Discriminator.self, forKey: .discriminator)
        switch discriminator {
        case .steel:
            self = .steel
        case .aluminuim:
            self = .aluminuim
        
        
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
                switch self {
                case .steel:
                    try container.encode(0, forKey: .discriminator)
                case .aluminuim:
                    try container.encode(1, forKey: .discriminator)
               
               
                }
    }
}



//MARK: - Suite Type
enum SuiteType: CaseIterable, CustomStringConvertible , Codable{
    case shortie
    case onePiece
    case twoPiece
    case semiDry
    case drySuite
    
    var description: String {
        switch self {
        case .shortie:
            return "shortie"
        case .onePiece:
            return "onePiece"
        case .twoPiece:
            return "two Piece"
        case .semiDry:
            return "semi Dry"
        case .drySuite:
            return "dry Suite"
            
        }
    }
}

extension SuiteType {
    enum Discriminator: String, Decodable {
        case shortie, onePiece, twoPiece, semiDry, drySuite
    }
    
    enum CodingKeys: String, CodingKey {
        case discriminator
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(Discriminator.self, forKey: .discriminator)
        switch discriminator {
        case .shortie:
            self = .shortie
        case .onePiece:
            self = .onePiece
        case .twoPiece:
            self = .twoPiece
        case .semiDry:
            self = .semiDry
        case .drySuite:
            self = .drySuite
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
                switch self {
                case .shortie:
                    try container.encode(0, forKey: .discriminator)
                case .onePiece:
                    try container.encode(1, forKey: .discriminator)
                case .twoPiece:
                    try container.encode(2, forKey: .discriminator)
                case .semiDry:
                    try container.encode(3, forKey: .discriminator)
                case .drySuite:
                    try container.encode(4, forKey: .discriminator)
                }
    }

}



//MARK: - weather
enum Weather: CaseIterable, CustomStringConvertible, Codable {
    case sunny
    case clowdy
    case windy
    case overcast
    
    
    var description: String {
        switch self {
        case .sunny:
            return "sunny"
        case .clowdy:
            return "clowdy"
        case .windy:
            return "windy"
        case .overcast:
            return "overcast"
       
            
        }
    }
}
extension Weather {
    enum Discriminator: String, Decodable {
        case sunny, clowdy, windy, overcast
    }
    
    enum CodingKeys: String, CodingKey {
        case discriminator
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(Discriminator.self, forKey: .discriminator)
        switch discriminator {
        case .sunny:
            self = .sunny
        case .clowdy:
            self = .clowdy
        case .windy:
            self = .windy
        case .overcast:
            self = .overcast
       
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
                switch self {
                case .sunny:
                    try container.encode(0, forKey: .discriminator)
                case .clowdy:
                    try container.encode(1, forKey: .discriminator)
                case .windy:
                    try container.encode(2, forKey: .discriminator)
                case .overcast:
                    try container.encode(3, forKey: .discriminator)
               
                }
    }

}


//MARK: - Swell
enum Swell: CaseIterable, CustomStringConvertible, Codable {
    case noSwell
    case moderateSwell
    case strongSwell
    
    
    
    var description: String {
        switch self {
        case .noSwell:
            return "no Swell"
        case .moderateSwell:
            return "moderate Swell"
        case .strongSwell:
            return "strong Swell"
       
       
            
        }
    }
}
extension Swell {
    enum Discriminator: String, Decodable {
        case noSwell, moderateSwell, strongSwell
    }
    
    enum CodingKeys: String, CodingKey {
        case discriminator
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let discriminator = try container.decode(Discriminator.self, forKey: .discriminator)
        switch discriminator {
        case .noSwell:
            self = .noSwell
        case .moderateSwell:
            self = .moderateSwell
        case .strongSwell:
            self = .strongSwell
        
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
                switch self {
                case .noSwell:
                    try container.encode(0, forKey: .discriminator)
                case .moderateSwell:
                    try container.encode(1, forKey: .discriminator)
                case .strongSwell:
                    try container.encode(2, forKey: .discriminator)
                
               
                }
    }

}
