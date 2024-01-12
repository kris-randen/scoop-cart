//
//  GroceryListView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import SwiftUI

struct GroceryListView: View {
    @StateObject var gvm = GroceryListViewModel()
    @StateObject var fvm = FoodItemsListViewModel()
    @State private var showingAddItemView = false
    @State private var navigate = false
    @State private var kind: Nutrient.Kind = .vitamin
    @State private var serving: Serving.Kind = .kcal2000
    
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Avenir Next Bold", size: 20)!, .foregroundColor: UIColor(Colors.scoopRed)]
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(gvm.items) { item in
                        GroceryListCellView(item: item.name, quantity: item.quantityDescription, unit: item.unitDescription)
                            .listRowInsets(EdgeInsets(top: -5, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationInlinify(title: Constants.NavigationTitle.groceryList)
                .sheet(isPresented: $showingAddItemView) {
                    AddGroceryItemView(vm: gvm)
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
                    Task {
                        fvm.profile = nil
                        await fvm.fetchNutritionInfo(for: gvm.items[0].name)
                        navigate = true
                    }
                } label: {
                    ScoopButtonLabelView()
                }
                if let profile = fvm.profile {
                    NavigationLink("", destination: HorizontalChartView(kind: $kind, serving: $serving, profile: profile), isActive: $navigate)
                }
            }
        }
        .accentColor(Colors.scoopRed)
    }
    
    private func deleteItems(at offsets: IndexSet) {
        offsets.map {gvm.items[$0].id}.forEach(gvm.remove)
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
