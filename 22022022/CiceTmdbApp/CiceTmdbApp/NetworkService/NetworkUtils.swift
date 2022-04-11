//
//  Utils.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 4/3/22.
//

import Foundation

class NetworkUtils{
    static let Authentication = "Authorization"
    static let BearerAuthentication = "Bearer 123456789"
}

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case options = "OPTIONS"
}

enum TargetEnvironment: Int {
    case DEV = 0
    case PRE = 1
    case PRO = 2
}

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    var urlContext: URLEnpoint.BaseUrlContext
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String, urlContext: URLEnpoint.BaseUrlContext) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
        self.urlContext = urlContext
    }
}

struct URLEnpoint {
    
    #if PRO
    static let defaultEnvironment: TargetEnvironment = TargetEnvironment.PRO
    #elseif PRE
    static let defaultEnvironment: TargetEnvironment = TargetEnvironment.PRE
    #else
    static let defaultEnvironment: TargetEnvironment = TargetEnvironment.DEV
    #endif
    
    enum BaseUrlContext{
        case backend
        case webService
        case heroku
    }
    
    //MOVIES
    static let endpointMoviesNowPlaying = "movie/now_playing?api_key=\(Constants.Api.getApiKey())"
    static let endpointMoviesPopular = "movie/popular?api_key=\(Constants.Api.getApiKey())"
    static let endpointMoviesTopRated = "movie/top_rated?api_key=\(Constants.Api.getApiKey())"
    static let endpointMoviesUpcoming = "movie/upcoming?api_key=\(Constants.Api.getApiKey())"
    
    //SHOWS
    static let endpointShowsAiringToday = "tv/airing_today?api_key=\(Constants.Api.getApiKey())"
    static let endpointShowsOnTheAir = "tv/on_the_air?api_key=\(Constants.Api.getApiKey())"
    static let endpointShowsPopular = "tv/popular?api_key=\(Constants.Api.getApiKey())"
    static let endpointShowsTopRated = "tv/top_rated?api_key=\(Constants.Api.getApiKey())"
}

extension URLEnpoint{
    static func getUrlBase(urlContext: BaseUrlContext) -> String {
        switch urlContext {
        case .backend:
            switch self.defaultEnvironment {
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        case .webService:
            switch self.defaultEnvironment {
            case .DEV:
                return "https://api.themoviedb.org/3/"
            case .PRE:
                return "https://api.themoviedb.org/3/"
            case .PRO:
                return "https://api.themoviedb.org/3/"
            }
        case .heroku:
            switch self.defaultEnvironment {
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        }
    }
}
