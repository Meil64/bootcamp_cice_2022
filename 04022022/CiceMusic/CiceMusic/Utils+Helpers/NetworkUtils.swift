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

struct RequestDTO {
    var params: [String: AnyObject]?
    var arrayParams: [[String: AnyObject]]?
    var method: HTTPMethods
    var endpoint: String
    
    init(params: [String: AnyObject]?, method: HTTPMethods, endpoint: String) {
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arrayParams: [[String: AnyObject]]?, method: HTTPMethods, endpoint: String) {
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
    }
}

struct URLEnpoint {
    static let baseUrl = "https://rss.applemarketingtools.com/api/v2/%@/"
    static let music = "music/most-played/%@/songs.json"
    static let podcast = "podcasts/top/%@/podcast-episodes.json"
    static let books = "books/top-free/%@/books.json"
    static let apps = "apps/top-free/%@/apps.json"
}
