//
//  Volume.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import Foundation

struct Volume: Codable {
    enum Unit: String, Codable, CaseIterable {
        case ml = "ml"
        case l = "l"
    }
    
    var value: Double
    var unit: Unit
    
    init(value: Double, unit: Unit) {
        self.value = value
        self.unit = unit
    }
}
