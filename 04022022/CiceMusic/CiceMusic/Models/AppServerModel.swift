//
//  AppServerModel.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 14/3/22.
//

import Foundation

// MARK: - AppServerModel
struct AppServerModel: Codable {
    let feed: FeedApp?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct FeedApp: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultApp]?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case id = "id"
        case author = "author"
        case links = "links"
        case copyright = "copyright"
        case country = "country"
        case icon = "icon"
        case updated = "updated"
        case results = "results"
    }
}

// MARK: - Result
struct ResultApp: Codable {
    let artistName: String?
    let id: String?
    let name: String?
    let kind: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case name = "name"
        case kind = "kind"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
        case releaseDate = "releaseDate"
    }
}
