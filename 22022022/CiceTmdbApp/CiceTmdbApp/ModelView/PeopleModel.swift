//
//  PeoplePopularModelView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 24/4/22.
//

import Foundation

struct PeopleModel: Identifiable {
    
    let id: Int?
    let knownFor: [KnownForModel]?
    let name: String?
    let profilePath: String?
    
    var profilePathUrl: URL { return URL(string: "https://image.tmdb.org/t/p/w500/\(profilePath ?? "")")! }
    
    static func fromServerModel(data: PeopleServerModel) -> PeopleModel {
        
        var dataKnownForModel: [KnownForModel] = []
        if let knownForModelUnw = data.knownFor {
            for i in 0..<knownForModelUnw.count {
                dataKnownForModel.append(KnownForModel.fromServerModel(data: knownForModelUnw[i]))
            }
        }
        return PeopleModel(id: data.id,
                           knownFor: dataKnownForModel,
                           name: data.name,
                           profilePath: data.profilePath)
    }
}

// MARK: - KnownFor
struct KnownForModel: Identifiable {
    let id: Int?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let originalTitle: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var yearText: String {
        guard let releaseDateUnw = releaseDate, let dateUnw = Utils.dateFormatter.date(from: releaseDateUnw) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: dateUnw)
    }
    
    static func fromServerModel(data: KnownForServerModel) -> KnownForModel {
        return KnownForModel(id: data.id,
                           overview: data.overview,
                           posterPath: data.posterPath,
                           releaseDate: data.releaseDate,
                           voteAverage: data.voteAverage,
                           originalTitle: data.originalTitle)
    }
}
