//
//  AddItemView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import SwiftUI

//struct AddItemView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @ObservedObject var vm: GroceryListViewModel
//    @State private var name: String = ""
//    @State private var quantityType: Quantity.QuantityType = .mass
//    @State private var value: Double = 0
//    @State private var massUnit: Mass.Unit = .gm
//    @State private var volUnit: Volume.Unit = .ml
//
//    var body: some View {
//        NavigationView {
//            Form {
//                Section(header: Text("Item Name")) {
//                    TextField("Enter item name", text: $name)
//                }
//                Section(header: Text("Quantity")) {
//                    Picker("Type", selection: $quantityType) {
//                        Text("Mass").tag(Quantity.QuantityType.mass)
//                        Text("Volume").tag(Quantity.QuantityType.volume)
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//
//                    TextField("Enter quantity", value: $value, format: .number)
//
//                    if quantityType == .mass {
//                        Picker("Unit", selection: $massUnit) {
//                            ForEach(Mass.Unit.allCases, id: \.self) { unit in
//                                Text(unit.rawValue).tag(unit)
//                            }
//                        }
//                    } else {
//                        Picker("Unit", selection: $volUnit) {
//                            ForEach(Volume.Unit.allCases, id: \.self) { unit in
//                                Text(unit.rawValue).tag(unit)
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Add New Item")
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button("Cancel") {
//                        presentationMode.wrappedValue.dismiss()
//                    }
//                }
//                ToolbarItem(placement: .topBarTrailing) {
//                    Button("Save") {
//                        save()
//                        presentationMode.wrappedValue.dismiss()
//                    }
//                }
//                .disabled(name.isEmpty || value <= 0)
//            }
//        }
//    }
//
//    private func save() {
//        let quantity: Quantity = quantityType == .mass ? .mass(Mass(value: value, unit: massUnit)) : .volume(Volume(value: value, unit: volUnit))
//
//        let item = GroceryItem(name: name, quantity: quantity)
//        vm.add(item)
//    }
//}

//#Preview {
//    AddItemView()
//}

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: GroceryListViewModel
    @State private var itemName: String = ""
    @State private var selectedQuantityType: Quantity.QuantityType = .mass
    @State private var quantityValue: Double = 0
    @State private var selectedMassUnit: Mass.Unit = .gm
    @State private var selectedVolumeUnit: Volume.Unit = .ml
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Item Name")) {
                    TextField("Enter item name", text: $itemName)
                }
                Section(header: Text("Quantity")) {
                    Picker("Type", selection: $selectedQuantityType) {
                        Text("Mass").tag(Quantity.QuantityType.mass)
                        Text("Volume").tag(Quantity.QuantityType.volume)
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Enter quantity", value: $quantityValue, format: .number)
                    
                    QuantityPickerView(quantityType: $selectedQuantityType, selectedMassUnit: $selectedMassUnit, selectedVolumeUnit: $selectedVolumeUnit)
                }
            }
            .navigationTitle("Add New Item")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { presentationMode.wrappedValue.dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveItem()
                        presentationMode.wrappedValue.dismiss()
                    }.disabled(itemName.isEmpty || quantityValue <= 0)
                }
            }
        }
    }
    
    private func saveItem() {
        let quantity: Quantity = selectedQuantityType == .mass
        ? .mass(Mass(value: quantityValue, unit: selectedMassUnit))
        : .volume(Volume(value: quantityValue, unit: selectedVolumeUnit))
        
        let newItem = GroceryItem(name: itemName, quantity: quantity)
        viewModel.add(newItem)
    }
}

