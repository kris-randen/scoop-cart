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
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Avenir Next Bold", size: 20)!, .foregroundColor: UIColor(Colors.scoopRed)]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(vm.items) { item in
                        GroceryListCellView(item: item.name, quantity: item.quantityDescription, unit: item.unitDescription)
                            .listRowInsets(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationInlinify(title: Constants.NavigationTitle.groceryList)
                .sheet(isPresented: $showingAddItemView) {
                    AddGroceryItemView(vm: vm)
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        HStack {
                            Spacer()
                            Button(action: add) {
                                Image(systemName: "mic.fill.badge.plus")
                                    .font(.title)
                            }
                            .foregroundColor(Colors.scoopRed)
                            Spacer()
                        }
                    }
                }
                Button {
                    
                } label: {
                    ScoopButtonLabelView()
                }
            }
        }
        .foregroundColor(Colors.scoopRed)
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
        "\(quantity)"
    }
    
    var unitDescription: String {
        "\(unit.name)"
    }
}

#Preview {
    GroceryListView()
}
