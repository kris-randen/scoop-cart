//
//  ScoopTextLabelView.swift
//  scoop-cart
//
//  Created by Krishnaswami Rajendren on 1/11/24.
//

import SwiftUI

struct ScoopTextLabelView: View {
    var text: String = "Tomato"
    var width: CGFloat = Constants.Width
    var alignment: Alignment = .leading
    
    var body: some View {
        Text(text)
            .frame(maxWidth: width, alignment: alignment)
            .lineLimit(1)
            .textFieldify(heightScaling: Dimensions.HeightScaling.textField, alignment: .center)
            .font(Fonts.signInTextField)
            .borderify(shape: Shapes.textField, color: Colors.scoopYellow)
            .clippify(shape: Shapes.textField)
            .shadowify()
            .foregroundColor(Colors.scoopRed)
    }
}

#Preview {
    ScoopTextLabelView()
}
