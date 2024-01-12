//
//  GroceryList.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import Foundation

actor GroceryList {
    private var items: [GroceryItem]
    
    init(items: [GroceryItem] = []) {
        self.items = items
    }
    
    func add(_ item: GroceryItem) {
        items.append(item)
    }
    
    func remove(_ id: UUID) {
        items.removeAll {$0.id == id}
    }
    
    func update(_ item: GroceryItem) {
        guard let index = items.firstIndex(where: { $0.id == item.id }) else { return }
        items[index] = item
    }
    
    func all() async -> [GroceryItem] {
        items
    }
}
