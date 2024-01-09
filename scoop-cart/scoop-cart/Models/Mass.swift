//
//  Mass.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import Foundation

struct Mass: Codable {
    enum Unit: String, Codable, CaseIterable {
        case gm = "gm"
        case kg = "kg"
    }
    
    var value: Double
    var unit: Unit
    
    init(value: Double, unit: Unit) {
        self.value = value
        self.unit = unit
    }
}
