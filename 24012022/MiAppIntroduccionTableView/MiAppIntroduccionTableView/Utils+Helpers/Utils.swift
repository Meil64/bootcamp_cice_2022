//
//  Utils.swift
//  MiAppIntroduccionTableView
//
//  Created by Carlos Carrera on 17/2/22.
//

import UIKit

protocol ReuseIdentifierView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReuseIdentifierView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

class Constantes {
    static let tituloListaMeses = "Meses"
    static let tituloListaCoches = "Coches"
    static let tituloListaPerfil = "Feed"
    static let imagePlaceholder = "fotoPlaceholder"
}
