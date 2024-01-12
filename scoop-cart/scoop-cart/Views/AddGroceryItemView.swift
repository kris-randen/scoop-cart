//
//  AddGroceryItemView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/11/24.
//

import SwiftUI

struct AddGroceryItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = GroceryListViewModel()
    @State var item: String = "Tomato"
    @State var quantity: Double = 1.25
    @State var unit: Units.Mass = .kg
    
    var body: some View {
        VStack {
            AddGroceryItemCellView(item: $item, quantity: $quantity, unit: $unit)
            Button {
                saveItem()
                presentationMode.wrappedValue.dismiss()
            } label: {
                ScoopButtonLabelView(name: "Add Item")
            }
            .padding()
        }
    }
    
    private func saveItem() {
        let newItem = GroceryItem(name: item, quantity: quantity, unit: unit)
        vm.add(newItem)
    }
}

#Preview {
    AddGroceryItemView(item: "Tomato", quantity: 1.5, unit: .kg)
}
