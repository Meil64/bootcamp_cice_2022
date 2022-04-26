//
//  Constants.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 4/4/22.
//

import Foundation

struct Constants {
    
    struct Api {
        private static let apiKey: [UInt8] = [33, 71, 91, 93, 26, 125, 103, 44, 6, 95, 6, 5, 18, 117, 22, 91, 11, 64, 42, 96, 41, 87, 82, 83, 0, 67, 118, 70, 93, 9, 24, 122]
        
        static func getApiKey() -> String {
            return Obfuscator().reveal(key: apiKey)
        }
    }
    
    static var totalPages = 3
}
