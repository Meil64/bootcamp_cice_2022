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
        if self.datosCumplimantados() {
            Utils.Constants().kPrefs.setValue(self.nombreTF.text, forKey: Utils.Constants().kNombre)
            Utils.Constants().kPrefs.setValue(self.apellidoTF.text, forKey: Utils.Constants().kApellido)
            Utils.Constants().kPrefs.setValue(self.direccionTF.text, forKey: Utils.Constants().kDireccion)
            Utils.Constants().kPrefs.setValue(self.telefonoTF.text, forKey: Utils.Constants().kTelefono)
            
            let imageData = self.imagenPerfil.image?.jpegData(compressionQuality: 0.5)
            Utils.Constants().kPrefs.setValue(imageData, forKey: Utils.Constants().kImage)
            
            let fechaActualizacion = Date()
            Utils.Constants().kPrefs.setValue(fechaActualizacion, forKey: Utils.Constants().kFecha)
            
            self.present(Utils.shared.muestraAlerta(titulo: "Saludos a todos",
                                                    mensaje: "Estamos salvando los datos con éxito",
                                                    completionHandler: { _ in
                                                        self.usuarioLogado = true
                                                        Utils.Constants().kPrefs.setValue(
                                                            self.usuarioLogado,
                                                            forKey: Utils.Constants().kUserLogado)
                
                                                    let vc = HomeViewCoordinator.homeView()
                                                    vc.modalTransitionStyle = .coverVertical
                                                    vc.modalPresentationStyle = .fullScreen
                                                    self.present(vc, animated: true, completion: nil)
                                                    }),
                         animated: true,
                         completion: nil)
        } else {
            self.present(Utils.shared.muestraAlerta(titulo: "Debes cumplimentar el formulario",
                                                    mensaje: "Selecciona una foto y te registrarás con éxito",
                                                    completionHandler: nil),
                         animated: true,
                         completion: nil)
        }
    }
    
    @IBAction func recuperarDatosACTION(_ sender: Any) {
        self.mostrarDatosGuardados()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionImageView()
        // Do any additional setup after loading the view.
    }
    
    private func datosCumplimantados() -> Bool {
        return !(self.nombreTF.text?.isEmpty ?? false) &&
        !(self.apellidoTF.text?.isEmpty ?? false) &&
        !(self.direccionTF.text?.isEmpty ?? false) &&
        !(self.telefonoTF.text?.isEmpty ?? false) &&
        existeFoto
    }
    
    private func configuracionImageView() {
        self.imagenPerfil.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(muestraSelectorFoto))
        self.imagenPerfil.addGestureRecognizer(tapGR)
    }
    
    @objc
    func muestraSelectorFoto() {
        //Compruebo si tengo acceso a la cámara (en simulador no se tiene acceso)
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            //Menú para elegir si cámara o biblioteca
            self.muestraPhotoMenu()
        } else {
            //Directamente la biblioteca
            self.muestraPhotoLibrary()
        }
    }
    
    private func muestraPhotoMenu() {
        let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: { _ in
            self.tomarFoto()
        }))
        actionSheetVC.addAction(UIAlertAction(title: "Escoger de la librería", style: .default, handler: { _ in
            self.muestraPhotoLibrary()
        }))
        self.present(actionSheetVC, animated: true, completion: nil)
    }
    
    private func muestraPhotoLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func tomarFoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    private func mostrarDatosGuardados() {
        self.nombreTF.text = Utils.Constants().kPrefs.string(forKey: Utils.Constants().kNombre)
        self.apellidoTF.text = Utils.Constants().kPrefs.string(forKey: Utils.Constants().kApellido)
        self.direccionTF.text = Utils.Constants().kPrefs.string(forKey: Utils.Constants().kDireccion)
        self.telefonoTF.text = Utils.Constants().kPrefs.string(forKey: Utils.Constants().kTelefono)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        self.fechaLBL.text = "Última actualización: \(dateFormatter.string(from: Utils.Constants().kPrefs.object(forKey: Utils.Constants().kFecha) as! Date))"
        
        self.imagenPerfil.image = UIImage(data: Utils.Constants().kPrefs.object(forKey: Utils.Constants().kImage) as! Data)
        self.existeFoto = true
    }
    
    //Funcionalidad para ocultar el teclado cuando tocas fuera del texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension RegistroViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //Código defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickerImageUnw = info[.originalImage] as? UIImage {
            self.imagenPerfil.contentMode = .scaleAspectFill
            self.imagenPerfil.image = pickerImageUnw
            self.existeFoto = true
        }
        
        //Código defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
