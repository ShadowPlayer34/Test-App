//
//  ConferencesListView.swift
//  TestTask
//
//  Created by Andrew Hudik on 5/3/25.
//

import SwiftUI

/// A view that displays a list of conferences.
struct ConferencesListView {
    @StateObject private var viewModel = ConferencesListViewModel()
    @State private var proccedToDetail: Bool = false
}

extension ConferencesListView: View {
    var body: some View {
        NavigationStack {
            List {
                let conferencesByMonth = viewModel.conferencesByMonth()

                ForEach(conferencesByMonth.keys.sorted(), id: \.self) { month in
                    Section(header: Text(month).font(.h4)) {
                        ForEach(conferencesByMonth[month] ?? [], id: \.id) { conference in
                            ConferenceElementView(conference: conference)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    proccedToDetail = true
                                }
                        }
                    }
                    .headerProminence(.increased)
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("Конференции"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $proccedToDetail) {
                EventDetailsView()
            }
        }
        .task {
            await viewModel.fetchConferences()
        }
    }
}

#Preview {
    ConferencesListView()
}
