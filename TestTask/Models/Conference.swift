//
//  Conference.swift
//  TestTask
//
//  Created by Andrew Hudik on 5/3/25.
//

import Foundation

/// A structure representing a conference.
struct Conference: Decodable {
    
    /// The unique identifier for the conference.
    let id: Int

    /// The name of the conference.
    let name: String

    /// The status of the conference.
    let status: String

    /// The image associated with the conference, including its URL and preview image.
    let image: ConferenceImage

    /// The start date of the conference.
    let startDate: String

    /// The end date of the conference.
    let endDate: String

    /// The country where the conference is held.
    let country: String

    /// The city where the conference is held.
    let city: String

    /// The categories associated with the conference.
    let categories: [ConferenceCategory]

    /// The type of the conference.
    let type: ConferenceType

    /// A short description or about section of the conference.
    let about: String?

    /// A computed property that indicates if the conference has been canceled.
    var isCanceled: Bool {
        status == "canceled"
    }

    /// A structure representing the image details of the conference.
    struct ConferenceImage: Decodable {

        /// The URL of the conference image.
        let url: String

        /// The preview URL of the conference image.
        let preview: String
    }

    /// A structure representing the category of the conference.
    struct ConferenceCategory: Decodable {

        /// The unique identifier of the category.
        let id: Int

        /// The name of the category.
        let name: String
    }

    /// A structure representing the type of the conference.
    struct ConferenceType: Decodable {

        /// The unique identifier of the conference type.
        let id: Int

        /// The name of the conference type.
        let name: String
    }

    /// A mapping of the coding keys used for decoding the JSON response.
    enum CodingKeys: String, CodingKey {
        case id, name, status, image, startDate, endDate, country, city, categories, type, about
    }

    /// A preview conference for testing purposes.
    static var preview: Conference {
        return Conference(
            id: 1,
            name: "Sample Conference",
            status: "Upcoming",
            image: ConferenceImage(url: "https://picsum.photos/500/300", preview: ""),
            startDate: "2025-03-10",
            endDate: "2025-03-12",
            country: "USA",
            city: "New York",
            categories: [ConferenceCategory(id: 1, name: "Tech")],
            type: ConferenceType(id: 1, name: "Conference"),
            about: "Test about"
        )
    }
}
