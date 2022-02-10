//
//  SegundaViewController.swift
//  MiAppPickerView
//
//  Created by Carlos Carrera on 10/2/22.
//

import UIKit

class SegundaViewController: UIViewController {
    
    //MARK: - Variables
    let dataSourceLocalidades = ["Tarazona","Grisel", "Malón", "San Martín"]
    let dataSourceCPs = ["50500", "50513", "50510", "50584"]
    let dataSourcePrioridadesTeletrabajo = ["Alta", "Media", "Baja"]
    let dataSourceFotosPerfil = ["Maria", "Felipe", "Maria", "Felipe"]
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var localidadesTF: UITextField!
    @IBOutlet weak var codigoPostalTF: UITextField!
    @IBOutlet weak var prioridadTeletrabajoTF: UITextField!
    @IBOutlet weak var perfilIV: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    
    private func configuracionUI(){
        
    }
}
