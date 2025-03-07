//
//  ConferenceElementView.swift
//  TestTask
//
//  Created by Andrew Hudik on 5/3/25.
//

import SwiftUI

/// A view that displays a single conference element.
struct ConferenceElementView {

    /// The conference data to be displayed.
    let conference: Conference
}

extension ConferenceElementView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            canceledBadge
            Text(conference.name)
                .font(.h1)
                .padding(.bottom, -4)
            imageAndDate
            TagListView(tags: conference.categories.map({ $0.name }))
                .padding(.bottom, -8)
            location
        }
        .padding()
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(conference.isCanceled ? .lightRed : .lightGrey)
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }

    private var imageAndDate: some View {
        // TODO: maybe will need to make it bigger
        HStack {
            AsyncImage(url: URL(string: conference.image.url)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 16, bottomLeading: 16)))
            } placeholder: {
                ColorShiftView()
            }
            // TODO: Maybe will need to fix it
            .padding(.trailing, -5)
            Text(conference.startDate.formatToShortDate())
                .frame(alignment: .center)
                .frame(maxWidth: .infinity)
                .font(.h3)
        }
        .frame(height: 104)
        .frame(maxWidth: .infinity)
        .background(conference.isCanceled ? .lightRed.opacity(0.5) : .lightBlue)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }

    private var location: some View {
        HStack {
            Image("geoPin")
            Text("\(conference.city), \(conference.country)")
                .font(.body2)
        }
    }

    @ViewBuilder
    private var canceledBadge: some View {
        if conference.isCanceled {
            CanceledCapsuleView()
                .padding(.bottom, -8)
        }
    }
}

#Preview {
    ConferenceElementView(conference: .preview)
}
