//
//  TankCap.swift
//  DivingApp
//
//  Created by ALI MOOSA on 24/12/2022.
//

import Foundation

struct Tanks : Equatable{
    var tankcap : Int
    static func ==(lhs : Tanks , rhs : Tanks ) -> Bool {
        return lhs.tankcap == rhs.tankcap
        
    }
    static var all : [Tanks] {
        return[Tanks(tankcap: 10),
        Tanks(tankcap: 12),
        Tanks(tankcap: 15)]
    }
}
