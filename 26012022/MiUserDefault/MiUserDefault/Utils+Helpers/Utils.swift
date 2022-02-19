//
//  Utils.swift
//  MiUserDefault
//
//  Created by Carlos Carrera on 19/2/22.
//

import Foundation
import UIKit

class Utils {
    
    static let shared = Utils()
    
    struct Constants {
        let kNombre = "NOMBRE"
        let kApellido = "APELLIDO"
        let kDireccion = "DIRECCIÓN"
        let kTelefono = "TELÉFONO"
        let kFecha = "FECHA_ACTUALIZACIÓN"
        let kImage = "IMAGEN_PERFIL"
        let kUserLogado = "USUARIO_LOGADO"
        let kPrefs = UserDefaults.standard
    }
    
    func muestraAlerta(titulo: String,
                       mensaje: String,
                       completionHandler: ((UIAlertAction) -> Void)? ) -> UIAlertController {
        let alertVC = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: completionHandler))
        return alertVC
    }
    
}

class Constantes {
    static let kNombre = "NOMBRE"
}
