//
//  ScoopNumField.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/11/24.
//

import SwiftUI

struct ScoopNumField: View {
    var shape = Shapes.textField
    @Binding var value: Double
    
    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .textFieldify(heightScaling: Dimensions.HeightScaling.textField)
                    .font(Fonts.signInTextField)
                    .borderify(shape: shape, color: Colors.scoopYellow)
                    .clippify(shape: shape)
                    .shadowify()
    }
}

#Preview {
    ScoopNumField(value: .constant(1.3))
}
