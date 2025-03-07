//
//  TagListView.swift
//  TestTask
//
//  Created by Andrew Hudik on 5/3/25.
//

import SwiftUI

/// A view that displays a list of tags.
struct TagListView {

    /// An array of tag strings to be displayed.
    let tags: [String]

    /// The background color of each tag. Defaults to `.white`.
    var tagBackgroundColor: Color = .white
}

extension TagListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(tags, id: \.self) { tag in
                    TagView(text: tag, backgroundColor: tagBackgroundColor)
                }
            }
        }
    }
}

#Preview {
    TagListView(tags: ["Gaming", "Crypto", "Gaming", "Crypto", "Gaming", "Crypto"])
}
