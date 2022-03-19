//
//  Utils.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 4/3/22.
//

import Foundation

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
    
    static let baseUrl = "https://rss.applemarketingtools.com/api/v2/%@/"
    static let music = "music/most-played/%@/songs.json"
    static let podcast = "podcasts/top/%@/podcast-episodes.json"
    static let books = "books/top-free/%@/books.json"
    static let apps = "apps/top-free/%@/apps.json"
    
    static let baseUrlHeroku = "https://iconspartan-app.herokuapp.com/"
    static let menu = "iCoMenuResponse"
}

extension URLEnpoint{
    static func getUrlBase(urlContext: BaseUrlContext) -> String {
        switch urlContext {
        case .backend:
            switch self.defaultEnvironment {
            case .DEV:
                return "https://www.azurecloud.com/api/v2/des"
            case .PRE:
                return "https://www.azurecloud.com/api/v2/pre"
            case .PRO:
                return "https://www.azurecloud.com/api/v2/pro"
            }
        case .webService:
            switch self.defaultEnvironment {
            case .DEV:
                return ""
            case .PRE:
                return ""
            case .PRO:
                return "https://rss.applemarketingtools.com/api/v2/us/"
            }
        case .heroku:
            switch self.defaultEnvironment {
            case .DEV:
                return "https://iconspartan-app.herokuapp.com/"
            case .PRE:
                return ""
            case .PRO:
                return ""
            }
        }
    }
}
