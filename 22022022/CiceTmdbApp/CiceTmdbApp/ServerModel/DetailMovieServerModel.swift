//
//  DetailMovieServerModel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 13/4/22.
//

import Foundation

// MARK: - DetailsMovieServerModel
struct DetailMovieServerModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: BelongsToCollection?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]?
    let productionCountries: [ProductionCountry]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let videos: Videos?
    let credits: Credits?

    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget = "budget"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case videos = "videos"
        case credits = "credits"
    }
    
    //Auxiliar para maquetar
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var genreText: String{
        return genres?.first?.name ?? "n/a"
    }
    
    var yearText: String {
        guard let releaseDateUnw = releaseDate, let dateUnw = Utils.dateFormatter.date(from: releaseDateUnw) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: dateUnw)
    }
    
    var durationText: String {
        guard let runtimeUnw = runtime, runtimeUnw > 0 else {
            return "n/a"
        }
        return Utils.durationFormatter.string(from: TimeInterval(runtimeUnw) * 60) ?? "n/a"
    }
    
    var ratingText: String {
        let rating = Int(voteAverage ?? 0)
        let ratingText = (0..<rating).reduce("") { (partialResult, _) -> String in
            return partialResult + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "N/A"
        }
        return "\(ratingText.count) / 10"
    }
    
    var cast: [Cast]? {
        credits?.cast
    }
    
    var crew: [Crew]? {
        credits?.crew
    }
    
    var directors: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "director" }
    }
    
    var producers: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "producer" }
    }
    
    var screenWriters: [Crew]? {
        crew?.filter { $0.job?.lowercased() == "story" }
    }
    
    var youtubeTrailers: [VideoApiResult]? {
        videos?.results?.filter { $0.youtubeURL != nil }
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    let id: Int?
    let name: String?
    let posterPath: String?
    let backdropPath: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
}

// MARK: - JSON local para maquetar
extension DetailMovieServerModel {
    static var stubbedDetailMovie: DetailMovieServerModel? {
        let response: DetailMovieServerModel? = try? Bundle.main.loadAndDecodeJSON(filename: "DetailMovie")
        return response
    }
}
