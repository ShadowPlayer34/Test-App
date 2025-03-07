//
//  ColorShiftView.swift
//  TestTask
//
//  Created by Andrew Hudik on 6/3/25.
//

import SwiftUI

struct ColorShiftView {
    @State private var colorShift: CGFloat = 0
}

extension ColorShiftView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(stops: [
            .init(color: .lightBlue, location: Double(colorShift)),
            .init(color: .secondary, location: Double(colorShift + 1)),
            .init(color: .lightBlue, location: Double(colorShift + 2))
        ]), startPoint: .leading, endPoint: .trailing)
        .mask(UnevenRoundedRectangle(topLeadingRadius: 15, bottomLeadingRadius: 15)
                .fill(Color.lightGrey))
            .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: true), value: colorShift)
            .onAppear {
                colorShift = -6
            }
    }
}

#Preview {
    ColorShiftView()
}
