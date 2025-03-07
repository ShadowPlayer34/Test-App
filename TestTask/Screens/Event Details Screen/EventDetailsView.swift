//
//  EventDetailsView.swift
//  TestTask
//
//  Created by Andrew Hudik on 7/3/25.
//

import SwiftUI

/// A view that displays the details of an event.
struct EventDetailsView {
    @StateObject private var viewModel = EventDetailsViewModel()
    @Environment(\.dismiss) private var dismiss
}

extension EventDetailsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if let conference = viewModel.conference {
                    conferenceHeader(conference)
                    conferenceImage(conference)
                    conferenceTags(conference)
                    conferenceDetails(conference)
                    registrationButton()
                    aboutSection(conference)
                } else {
                    ProgressView()
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            .task {
                await viewModel.fetchConferenceInformation()
            }
        }
    }

    @ViewBuilder
    private func conferenceHeader(_ conference: Conference) -> some View {
        VStack(alignment: .leading) {
            Text(conference.type.name)
                .font(.body2)
                .padding(.bottom, 2)
            Text(conference.name)
                .font(.h1)
        }
    }

    @ViewBuilder
    private func conferenceImage(_ conference: Conference) -> some View {
        AsyncImage(url: URL(string: conference.image.url)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        } placeholder: {
            ColorShiftView()
        }
        .frame(height: 219)
        .padding(.vertical)
    }

    @ViewBuilder
    private func conferenceDetails(_ conference: Conference) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Image("calendar")
                Text("\(conference.startDate.formatFullDate()), \(viewModel.durationText)")
                    .font(.buttonLarge)
            }
            HStack {
                Image("geoPin")
                    .resizable()
                    .foregroundStyle(.customBlue)
                    .frame(width: 20, height: 23)
                Text("\(conference.city), \(conference.country)")
                    .font(.buttonLarge)
                    .padding(.leading, 3)
            }
            .padding(.leading, 2)
        }
    }

    @ViewBuilder
    private func registrationButton() -> some View {
        Button {
            // TODO: Implement
        } label: {
            Text("Регистрация")
                .foregroundStyle(.white)
                .font(.buttonLarge)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.customBlue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.top, 8)
    }

    @ViewBuilder
    private func aboutSection(_ conference: Conference) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("О событии")
                .font(.h4)
            Text(conference.about ?? "")
                .font(.body1)
        }
        .padding(.top, 60)
    }

    @ViewBuilder
    private func conferenceTags(_ conference: Conference) -> some View {
        TagListView(
            tags: conference.categories.map { $0.name },
            tagBackgroundColor: .lightGrey
        )
    }
}

#Preview {
    EventDetailsView()
}
