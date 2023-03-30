//
//  DetectedGhst.swift
//  SpiritDetect
//
//  Created by Larry Bonnette on 3/6/23.
//
// This is the red ghost in a rectangle that will be
// displayed on the scanner page when a spirit is detected

import SwiftUI

struct DetectedGst: View {
    var body: some View {
        // hold
        VStack {
            ZStack {
                Rectangle()
                    .strokeBorder(Color.red, lineWidth: 4)
                    .frame(width: 170, height: 120)
// This is the drawing of the ghost that appears in the above rectangle
                Path { path in
                    path.move(to: CGPoint(x: 26.203981, y: 23.265434))
                    path.addCurve(to: CGPoint(x: 43.71242, y: 22.520394), control1: CGPoint(x: 26.203981, y: 23.265434), control2: CGPoint(x: 32.909339, y: 5.384476))
                    path.addCurve(to: CGPoint(x: 37.007061, y: 68.712869), control1: CGPoint(x: 43.71242, y: 22.520394), control2: CGPoint(x: 74.631575, y: 33.695992))
                    path.addCurve(to: CGPoint(x: 26.203981, y: 23.265435), control1: CGPoint(x: 37.007061, y: 68.712869), control2: CGPoint(x: -2.107537, y: 36.303636))
                    path.closeSubpath()
                    path.move(to: CGPoint(x: 33.188141, y: 22.351196))
                    path.addCurve(to: CGPoint(x: 31.833523, y: 23.705814), control1: CGPoint(x: 33.188141, y: 23.099331), control2: CGPoint(x: 32.581658, y: 23.705814))
                    path.addCurve(to: CGPoint(x: 30.478905, y: 22.351196), control1: CGPoint(x: 31.085388, y: 23.705814), control2: CGPoint(x: 30.478905, y: 23.099331))
                    path.addCurve(to: CGPoint(x: 31.833523, y: 20.996578), control1: CGPoint(x: 30.478905, y: 21.603061), control2: CGPoint(x: 31.085388, y: 20.996578))
                    path.addCurve(to: CGPoint(x: 33.188141, y: 22.351196), control1: CGPoint(x: 32.581658, y: 20.996578), control2: CGPoint(x: 33.188141, y: 21.603061))
                    path.closeSubpath()
                    path.move(to: CGPoint(x: 39.28392, y: 22.351196))
                    path.addCurve(to: CGPoint(x: 37.929302, y: 23.705814), control1: CGPoint(x: 39.28392, y: 23.099331), control2: CGPoint(x: 38.677437, y: 23.705814))
                    path.addCurve(to: CGPoint(x: 36.574684, y: 22.351196), control1: CGPoint(x: 37.181167, y: 23.705814), control2: CGPoint(x: 36.574684, y: 23.099331))
                    path.addCurve(to: CGPoint(x: 37.929302, y: 20.996578), control1: CGPoint(x: 36.574684, y: 21.603061), control2: CGPoint(x: 37.181167, y: 20.996578))
                    path.addCurve(to: CGPoint(x: 39.28392, y: 22.351196), control1: CGPoint(x: 38.677437, y: 20.996578), control2: CGPoint(x: 39.28392, y: 21.603061))
                    path.closeSubpath()
                    path.move(to: CGPoint(x: 40.638538, y: 29.124289))
                    path.addCurve(to: CGPoint(x: 31.494866, y: 29.462942), control1: CGPoint(x: 33.526795, y: 21.673889), control2: CGPoint(x: 31.494866, y: 29.462942))
                    path.addCurve(to: CGPoint(x: 40.638538, y: 29.124289), control1: CGPoint(x: 31.494866, y: 29.462942), control2: CGPoint(x: 40.927242, y: 33.823158))
                    path.closeSubpath()
                }
                .stroke(Color.red, lineWidth: 2)
                .frame(width: 170, height: 120)
                .offset(x: 45, y: 15)
                .scaleEffect(CGSize(width: 1.5, height: 1.5))
            }
        }
    }
}


