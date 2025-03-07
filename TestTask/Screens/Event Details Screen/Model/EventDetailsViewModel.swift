//
//  EventDetailsViewModel.swift
//  TestTask
//
//  Created by Andrew Hudik on 7/3/25.
//

import Foundation

/// A view model that manages the state and logic for event details.
@MainActor
class EventDetailsViewModel: ObservableObject {

    /// The conference object containing the event details.
    @Published var conference: Conference?

    /// An error message that describes any issues encountered while fetching data.
    @Published var errorMessage: String?

    @Published var durationText: String = ""

    private let apiService = APIService()

    /// Fetches the conference information asynchronously.
    ///
    /// - Updates the `conference` property with the fetched data if successful.
    /// - Sets the `errorMessage` property if an error occurs during the fetch operation.
    ///
    /// This method handles both specific API errors and general errors.
    func fetchConferenceInformation() async {
        do {
            conference = try await apiService.fetchConferenceInformation()
            durationText = daysBetweenDates(conference?.startDate ?? "", conference?.endDate ?? "")
            errorMessage = nil
        } catch let error as APIError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Что-то пошло не так."
        }
    }

    /// Calculates the number of days between two date strings and returns a formatted string.
    /// - Parameters:
    ///   - startDateString: The start date as a `String`.
    ///   - endDateString: The end date as a `String`.
    /// - Returns: The number of days as a formatted `String`, e.g., "1 день", "2 дня", "5 дней".
    func daysBetweenDates(_ startDateString: String, _ endDateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        guard let startDate = dateFormatter.date(from: startDateString),
              let endDate = dateFormatter.date(from: endDateString) else {
            return "Invalid dates"
        }

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        guard let days = components.day else {
            return "Error calculating days"
        }

        if days == 1 {
            return "\(days) день"
        } else if days > 1 && days < 5 {
            return "\(days) дня"
        } else {
            return "\(days) дней"
        }
    }
}
