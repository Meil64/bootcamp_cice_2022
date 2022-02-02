//
//  ViewController.swift
//  MiPrimeraApp
//
//  Created by Carlos Carrera on 1/2/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Variables
    
    //MARK: - IBOutlet
    @IBOutlet weak var miHolaMundo: UILabel!
    @IBOutlet weak var miSaludoMasLargo: UILabel!
    @IBOutlet weak var miBotonSaludaATodos: UIButton!
    
    //MARK: - IBActions
    @IBAction func miBottonSaludaATodosACTION(_ sender: UIButton) {
        self.miHolaMundo.text = "Hola al Bootcamp de iOS CICE 2022"
        self.miBotonSaludaATodos.setTitle("¡Pulsado!", for: .normal)
        self.miBotonSaludaATodos.layer.cornerRadius = 10
    }
    
    //MARK: - Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        self.estamosCurrando()
    }

    //MARK: - Funciones privadas
    private func estamosCurrando(){
        print("Aqui estamos currando a tope")
    }
    
}

