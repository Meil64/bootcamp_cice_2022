//
//  MoviesTVModelView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 7/4/22.
//

import Foundation

struct MoviesTVModel: Identifiable {

    //Este modelo de datos se utiliza tanto para Movie como para TVShow
    
    let id: Int?
    let backdropPath: String?
    let posterPath: String?
    let title: String?
    
    var posterUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath ?? "")")!
    }
    
    var backdropUrl: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500/\(backdropPath ?? "")")!
    }
}
