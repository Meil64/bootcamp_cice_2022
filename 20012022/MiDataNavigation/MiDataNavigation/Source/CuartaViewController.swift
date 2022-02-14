//
//  CuartaViewController.swift
//  MiDataNavigation
//
//  Created by Carlos Carrera on 13/2/22.
//

import UIKit
import MessageUI

class CuartaViewController: UIViewController {
    
    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    @IBOutlet weak var codigoPostalLBL: UILabel!
    @IBOutlet weak var ciudadLBL: UILabel!
    @IBOutlet weak var coordenadasLBL: UILabel!
    
    // MARK: - IBActions
    @IBAction func enviarTodaLaInformacionMailACTION(_ sender: Any) {
        
        if MFMailComposeViewController.canSendMail() {
            self.present(Utils.shared.configuracionMailCompose(delegate: self, data: datosUsuario), animated: true, completion: nil)
        } else {
            self.present(Utils.shared.showAlertVC(title: "Mail no enviado", message: Utils.shared.datosUsuarioToString(datos: datosUsuario)),
                         animated: true,
                         completion: nil)
        }
    }    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI() {
        self.miNombreLBL.text = "Mi nombre es: \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi apellido es: \(self.datosUsuario.apellidoData ?? "")"
        self.miTelefonoLBL.text = "Mi teléfono es: \(self.datosUsuario.telefonoData ?? "")"
        self.miDireccionLBL.text = "Mi dirección es: \(self.datosUsuario.direccionData ?? "")"
        self.edadPerroLBL.text = "Mi edadPerro es: \(self.datosUsuario.edadPerroData ?? "")"
        self.codigoPostalLBL.text = "Mi código postal es: \(self.datosUsuario.cpData ?? "")"
        self.ciudadLBL.text = "Mi ciudad es: \(self.datosUsuario.ciudadData ?? "")"
        self.coordenadasLBL.text = "Mi geoposición es: \(self.datosUsuario.geoposicionData ?? "")"
    }
}

extension CuartaViewController: MFMailComposeViewControllerDelegate{
    func mailComposeController(_ controller: MFMailComposeViewController,
                               didFinishWith result: MFMailComposeResult,
                               error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
