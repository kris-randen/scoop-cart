//
//  GroceryItem.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import Foundation

typealias GroceryItems = [GroceryItem]

struct GroceryItem: Identifiable, Codable {
    var id: UUID
    var name: String
    var quantity: Double
    var unit: Units.Mass
    
    init(id: UUID = UUID(), name: String, quantity: Double, unit: Units.Mass = .gm) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.unit = unit
    }
}
