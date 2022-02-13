//
//  Utils.swift
//  MiDataNavigation
//
//  Created by Carlos Carrera on 13/2/22.
//

import Foundation
import UIKit

class Utils{
    
    static let shared = Utils()
    
    
    //Cmd+Opt+Shift+7
    /// method showAlertVC return an alert generic component
    /// - Parameters:
    ///   - title: title put from VC to Alert generic component
    ///   - message: message put from VC to Alert generic component
    /// - Returns: return UIAlertController component
    func showAlertVC(title: String, message: String) -> UIAlertController {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alertVC
    }
}

struct DatosUsuarioModel{
    var nombreData: String?
    var apellidoData: String?
    var telefonoData: String?
    var direccionData: String?
    var edadPerroData: String?
    var cpData: String?
    var ciudadData: String?
    var geoposicionData: String?
}
