//
//  MenuServerModel.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 20/3/22.
//

import Foundation

// MARK: - MenuServerModel
struct MenuServerModel: Codable {
    let menuResponse: [MenuResponse]?

    enum CodingKeys: String, CodingKey {
        case menuResponse = "menuResponse"
    }
}

// MARK: - MenuResponse
struct MenuResponse: Codable {
    let menu: Menu?

    enum CodingKeys: String, CodingKey {
        case menu = "menu"
    }
}

// MARK: - Menu
struct Menu: Codable {
    let imagen: String?
    let literal: String?

    enum CodingKeys: String, CodingKey {
        case imagen = "imagen"
        case literal = "literal"
    }
}
