//
//  CanceledCapsuleView.swift
//  TestTask
//
//  Created by Andrew Hudik on 6/3/25.
//

import SwiftUI

struct CanceledCapsuleView { }

extension CanceledCapsuleView: View {
    var body: some View {
        HStack {
            Image(.lightning)
                .padding(.trailing, -6)
            Text("Отменено")
                .font(.captionSmall)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .overlay(content: {
            Capsule()
                .stroke(Color.red, lineWidth: 1)
        })
        .foregroundStyle(.red)
    }
}

#Preview {
    CanceledCapsuleView()
}
