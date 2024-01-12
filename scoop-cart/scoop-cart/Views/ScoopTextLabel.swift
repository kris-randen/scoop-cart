//
//  ScoopTextLabel.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/10/24.
//

import SwiftUI

struct ScoopTextLabel: View {
    var shape = Shapes.textField
    var text: String
    
    var body: some View {
        Text(text)
        .textFieldify(heightScaling: Dimensions.HeightScaling.textField)
        .font(Fonts.signInTextField)
        .borderify(shape: shape, color: Colors.scoopYellow)
        .clippify(shape: shape)
        .shadowify()
        .fontWeight(.black)
        .foregroundColor(Colors.scoopRed)
    }
}

#Preview {
    ScoopTextLabel(text: "Tomato")
}
