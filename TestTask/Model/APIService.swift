//
//  APIService.swift
//  TestTask
//
//  Created by Andrew Hudik on 6/3/25.
//

import Foundation

/// Handles network requests for fetching conference data.
class APIService: ObservableObject {
    private let baseUrlString: String = "https://partnerkin.com/api_ios_test/"
    private let apiKey: String = "DMwdj29q@S29shslok2"

    /// Fetches a list of conferences.
    func fetchConferencesList() async throws -> [Conference] {
        guard let listUrl = URL(string: baseUrlString + "list?api_key=" + apiKey) else {
            throw APIError.badURL
        }

        let (data, response) = try await URLSession.shared.data(from: listUrl)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.requestFailed
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(ConferencesListResponse.self, from: data)
            return result.conferences
        } catch {
            throw APIError.decodingFailed
        }
    }

    /// Fetches details of a specific conference.
    func fetchConferenceInformation() async throws -> Conference {
        guard let conferenceUrl = URL(string: baseUrlString + "view?api_key=" + apiKey) else {
            throw APIError.badURL
        }

        let (data, responce) = try await URLSession.shared.data(from: conferenceUrl)

        guard let httpResponce = responce as? HTTPURLResponse, (200...299).contains(httpResponce.statusCode) else {
            throw APIError.requestFailed
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(ConferenceResponse.self, from: data)
            dump(result.conference)
            return result.conference
        } catch {
            throw APIError.decodingFailed
        }
    }
}

/// Possible API errors.
enum APIError: LocalizedError {
    case badURL
    case requestFailed
    case decodingFailed
    case unknown

    var errorDescription: String? {
        switch self {
        case .badURL: return "Invalid URL."
        case .requestFailed: return "Network request failed."
        case .decodingFailed: return "Failed to decode response."
        case .unknown: return "An unknown error occurred."
        }
    }
}

/// Response structure for the list of conferences.
struct ConferencesListResponse: Decodable {
    let conferences: [Conference]

    enum CodingKeys: String, CodingKey {
        case data
    }

    enum DataKeys: String, CodingKey {
        case result
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
        let resultArray = try dataContainer.decode([Result].self, forKey: .result)
        conferences = resultArray.map { $0.conference }
    }

    struct Result: Decodable {
        let conference: Conference
    }
}

/// Response structure for a single conference.
struct ConferenceResponse: Decodable {
    let conference: Conference

    enum CodingKeys: String, CodingKey {
        case conference = "data"
    }
}
