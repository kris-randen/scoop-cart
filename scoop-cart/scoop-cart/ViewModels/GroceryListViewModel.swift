//
//  GroceryListViewModel.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import Foundation

@MainActor
class GroceryListViewModel: ObservableObject {
    @Published private(set) var items: GroceryItems = []
    private let list: GroceryList
    
    init(groceryList: GroceryList = GroceryList()) {
        self.list = groceryList
        load()
    }
    
    func load() {
        Task {
            self.items = await list.all()
        }
    }
    
    func add(name: String, quantity: Quantity) {
        let item = GroceryItem(name: name, quantity: quantity)
        Task {
            await list.add(item)
            load()
        }
    }
    
    func add(_ item: GroceryItem) {
        Task {
            await list.add(item)
            load()
        }
    }
    
    func remove(_ id: UUID) {
        Task {
            await list.remove(id)
            load()
        }
    }
    
    func update(_ item: GroceryItem) {
        Task {
            await list.update(item)
            load()
        }
    }
}
