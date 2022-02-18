//
//  RegistroViewController.swift
//  MiUserDefault
//
//  Created by Carlos Carrera on 18/2/22.
//

import UIKit

class RegistroViewController: UIViewController {
    
    // MARK: - Variables globales
    var existeFoto = false
    var usuarioLogado = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var nombreTF: UITextField!
    @IBOutlet weak var apellidoTF: UITextField!
    @IBOutlet weak var direccionTF: UITextField!
    @IBOutlet weak var telefonoTF: UITextField!
    @IBOutlet weak var imagenPerfil: UIImageView!
    @IBOutlet weak var fechaLBL: UILabel!
    
    // MARK: - IBActions
    
    @IBAction func guardarDatosACTION(_ sender: Any) {
    }
    
    @IBAction func recuperarDatosACTION(_ sender: Any) {
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
