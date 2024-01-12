//
//  QuantityPickerView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/9/24.
//

import SwiftUI

struct QuantityPickerView: View {
    @Binding var quantityType: Quantity.Kind
    @Binding var selectedMassUnit: Mass.Unit
    @Binding var selectedVolumeUnit: Volume.Unit
    
    var body: some View {
        Group {
            if quantityType == .mass {
                Picker("Unit", selection: $selectedMassUnit) {
                    ForEach(Mass.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
            } else {
                Picker("Unit", selection: $selectedVolumeUnit) {
                    ForEach(Volume.Unit.allCases, id: \.self) { unit in
                        Text(unit.rawValue).tag(unit)
                    }
                }
            }
        }
    }
}
