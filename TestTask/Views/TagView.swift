//
//  TagView.swift
//  TestTask
//
//  Created by Andrew Hudik on 5/3/25.
//

import SwiftUI

/// A view that displays a single tag.
struct TagView {

    /// The text of the tag to be displayed.
    let text: String

    /// The background color of the tag. Defaults to `.white`.
    var backgroundColor: Color = .white
}

extension TagView: View {
    var body: some View {
        Text(text)
            .padding(.horizontal)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .clipShape(Capsule())
            .font(.captionSmall)
    }
}

#Preview {
    TagView(text: "Gaming")
}
