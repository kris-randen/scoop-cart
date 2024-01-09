//
//  GroceryListView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import SwiftUI

struct GroceryListView: View {
    @StateObject var vm = GroceryListViewModel()
    @State private var showingAddItemView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        Text(item.quantityDescription)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Grocery List")
            .sheet(isPresented: $showingAddItemView) {
                AddItemView(viewModel: vm)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: add) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.map {vm.items[$0].id}.forEach(vm.remove)
    }
    
    private func add() {
        /// Implementation for adding a new item
        showingAddItemView = true
    }
}

extension GroceryItem {
    var quantityDescription: String {
        switch quantity {
        case .mass(let mass):
            return "\(mass.value) \(mass.unit.rawValue)"
        case .volume(let volume):
            return "\(volume.value) \(volume.unit.rawValue)"
        }
    }
}

#Preview {
    GroceryListView()
}
