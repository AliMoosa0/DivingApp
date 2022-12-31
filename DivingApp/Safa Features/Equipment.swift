//
//  Equipment.swift
//  DivingApp
//
//  Created by Safa Juma on 31/12/2022.
//

import Foundation

class Equipment: Codable {
    let title: String
    var isChecked: Bool = false
    
    init(title: String){
        self.title = title
    }
    

    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    static let archiveURL = documentsDirectory.appendingPathComponent("equipment").appendingPathExtension("plist")

    static func saveEquipment(_ equipment: [Equipment]){
        let propertyListEncoder = PropertyListEncoder()
        let codedEquipment = try? propertyListEncoder.encode(equipment)
        try? codedEquipment?.write(to: archiveURL, options: .noFileProtection)
    }

    static func loadEquipment() -> [Equipment]? {
        guard let codedEquipment = try? Data(contentsOf: archiveURL) else {return nil}
        let propertListDecoder = PropertyListDecoder()
        return try? propertListDecoder.decode(Array<Equipment>.self, from: codedEquipment)
    }
    
    /*
    var equipment : [Equipment] = ["Regulator","Mask", "Snorkel", "Wetsuit", "Defog", "Fins and booties", "Surface Marker Buoy", "Dive weight", "Dive Computer", "Diving Knife", "Dive Light", "Tank Bangers", "Compass", "Writing Slates", "First Aid Kit", "Dry box", "Underwater Camera"].compactMap({Equipment(title: $0)})
     */
    
    
}





