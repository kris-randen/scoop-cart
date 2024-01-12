//
//  AddItemView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var vm = GroceryListViewModel()
    @State private var itemName: String = ""
    @State private var quantityType: Quantity.Kind = .mass
    @State private var value: Double = 0
    @State private var massUnit: Mass.Unit = .gm
    @State private var volumeUnit: Volume.Unit = .ml
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont(name: "Avenir Next Bold", size: 20)!, .foregroundColor: UIColor(Colors.scoopRed)]
    }
    
    init(vm: GroceryListViewModel) {
        self.init()
        self.vm = vm
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Name".camelCased).font(Fonts.halfWidthButtonLabel)) {
                    TextField(text: $itemName) {
                        Text("Enter item name")
                    }
                    
                    .font(Fonts.signInTextField)
                    .borderify(shape: Shapes.textField, color: Colors.scoopYellow)
                    .clippify(shape: Shapes.textField)
                    .shadowify()
                }
                Section(header: Text("Quantity")) {
                    Picker("Type", selection: $quantityType) {
                        Text("Mass")
                            .tag(Quantity.Kind.mass)
                        Text("Volume")
                            .tag(Quantity.Kind.volume)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Enter quantity", value: $value, format: .number)
                    
                    QuantityPickerView(quantityType: $quantityType, selectedMassUnit: $massUnit, selectedVolumeUnit: $volumeUnit)
                }
            }
            .navigationInlinify(title: Constants.NavigationTitle.addItem)
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button { presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        saveItem()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(itemName.isEmpty || value <= 0)
                }
            }
        }
        .foregroundColor(Colors.scoopRed)
    }
    
    private func saveItem() {
        let quantity: Quantity = quantityType == .mass
        ? .mass(Mass(value: value, unit: massUnit))
        : .volume(Volume(value: value, unit: volumeUnit))
        
        let newItem = GroceryItem(name: itemName, quantity: quantity)
        vm.add(newItem)
    }
}

#Preview {
    AddItemView()
}
