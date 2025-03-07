//
//  ConferencesListViewModel.swift
//  TestTask
//
//  Created by Andrew Hudik on 6/3/25.
//

import Foundation

/// A view model that manages the logic and state for the list of conferences.
@MainActor
class ConferencesListViewModel: ObservableObject {

    /// A list of conferences to be displayed.
    @Published var conferences: [Conference] = [] {
        didSet {
            cachedGroupedConferences = nil
        }
    }

    /// An error message that describes any issues encountered while fetching data.
    @Published var errorMessage: String?

    private var cachedGroupedConferences: [String: [Conference]]?

    private let apiService = APIService()

    /// Fetches the list of conferences asynchronously.
    ///
    /// - Updates the `conferences` property with the fetched data if successful.
    /// - Sets the `errorMessage` property if an error occurs during the fetch operation.
    ///
    /// This method handles both specific API errors and general errors.
    func fetchConferences() async {
        do {
            conferences = try await apiService.fetchConferencesList()
            errorMessage = nil
        } catch let error as APIError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Что-то пошло не так."
        }
    }

    /// Groups the conferences by month based on their start date.
    ///
    /// - Returns: A dictionary where keys are strings representing the month and year, and values are arrays of conferences that start in that month.
    /// - Caches the grouped conferences to improve performance on subsequent calls.
    func conferencesByMonth() -> [String: [Conference]] {
        if let cached = cachedGroupedConferences {
            return cached
        }

        var groupedConferences: [String: [Conference]] = [:]

        for conference in conferences {
            let monthYear = conference.startDate.convertToMonthYearFormat()
            if groupedConferences[monthYear] == nil {
                groupedConferences[monthYear] = []
            }
            groupedConferences[monthYear]?.append(conference)
        }

        cachedGroupedConferences = groupedConferences
        return groupedConferences
    }
}
