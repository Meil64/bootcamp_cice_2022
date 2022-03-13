//
//  BookServerModel.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 13/3/22.
//

import Foundation

// MARK: - BookServerModel
struct BookServerModel: Codable {
    let feed: FeedBook?

    enum CodingKeys: String, CodingKey {
        case feed = "feed"
    }
}

// MARK: - Feed
struct FeedBook: Codable {
    let title: String?
    let id: String?
    let author: Author?
    let links: [Link]?
    let copyright: String?
    let country: String?
    let icon: String?
    let updated: String?
    let results: [ResultBook]?

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
struct ResultBook: Codable {
    let artistName: String?
    let id: String?
    let name: String?
    let releaseDate: String?
    let kind: String?
    let artistId: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let genres: [Genre]?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case id = "id"
        case name = "name"
        case releaseDate = "releaseDate"
        case kind = "kind"
        case artistId = "artistId"
        case artistUrl = "artistUrl"
        case artworkUrl100 = "artworkUrl100"
        case genres = "genres"
        case url = "url"
    }
}
