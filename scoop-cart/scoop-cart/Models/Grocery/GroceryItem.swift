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
    var quantity: Quantity
    
    init(id: UUID = UUID(), name: String, quantity: Quantity) {
        self.id = id
        self.name = name
        self.quantity = quantity
    }
}
