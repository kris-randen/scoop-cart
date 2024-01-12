//
//  RoundedRectBottomLeftCap.swift
//  messaging
//
//  Created by Krishnaswami Rajendren on 10/27/22.
//

import SwiftUI

struct RoundedRectBottomLeftCap: View {
    var line: RoundedRect
    
    var body: some View {
        Path { path in
            path.move(to: line.bottomLeftCenterGlobal)
            path.addArc(
                center: line.bottomLeftCenterGlobal,
                radius: line.radius,
                startAngle: 180.degrees,
                endAngle: 90.degrees,
                clockwise: true
            )
        }
    }
}

struct RoundedRectBottomLeftCap_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectBottomLeftCap(line: RoundedRect(x: 0, y: 0, width: 100, height: 400, radiusScaling: 0.3))
    }
}