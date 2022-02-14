//
//  Utils.swift
//  MiDataNavigation
//
//  Created by Carlos Carrera on 13/2/22.
//

import Foundation
import UIKit
import MessageUI

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
    
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField) {
        
        //Creo un PickerView
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        
        //Le asigno el picker al textField
        textField.inputView = pickerView
    }
    
    func checkTextFields(textos: [UITextField]) -> Bool {
        for item in textos {
            if let text = item.text {
                if(text.isEmpty) {
                    return false
                }
            }
            else {
                return false
            }
        }
        return true
    }
    
    func configuracionMailCompose(delegate: MFMailComposeViewControllerDelegate, data: DatosUsuarioModel) -> MFMailComposeViewController{
        let mailCompo = MFMailComposeViewController()
        mailCompo.mailComposeDelegate = delegate
        mailCompo.setToRecipients(["info@mail.com", "masinfo@mail.com"])
        mailCompo.setSubject("Asunto del mensaje")
        let emailBody = datosUsuarioToString(datos: data)
        mailCompo.setMessageBody(emailBody, isHTML: false)
        return mailCompo
    }
    
    func datosUsuarioToString(datos: DatosUsuarioModel) -> String {
        return "Nuevo formulario de usuario \n " +
        "Nombre: \(datos.nombreData ?? "") \n" +
        "Apellido: \(datos.apellidoData ?? "") \n" +
        "Teléfono: \(datos.telefonoData ?? "") \n" +
        "Dirección: \(datos.direccionData ?? "") \n" +
        "Edad del perro: \(datos.edadPerroData ?? "") \n" +
        "Código Postal: \(datos.cpData ?? "") \n" +
        "Ciudad: \(datos.ciudadData ?? "") \n" +
        "Geoposición: \(datos.geoposicionData ?? "")"
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
