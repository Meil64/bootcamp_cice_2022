//
//  NuevaTareaViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

class NuevaTareaViewController: UIViewController {

    // MARK: - Variables globales
    let dataSourcePrioridad = ["ALTA", "MEDIA-ALTA", "MEDIA", "MEDIA-BAJA", "BAJA"]
    var nombreCategoria = "Sin categoría"
    var fotoSeccionada = false
    
    // MARK: - IBOutlets
    @IBOutlet weak var nuevaTareaTF: UITextField!
    @IBOutlet weak var prioridadTF: UITextField!
    @IBOutlet weak var fechaTF: UITextField!
    @IBOutlet weak var categoriaLBL: UILabel!
    @IBOutlet weak var descripcionTV: UITextView!
    @IBOutlet weak var imagenTareaIV: UIImageView!
    @IBOutlet weak var categoriaBTN: UIButton!
    @IBOutlet weak var salvarDatosBTN: UIButton!
    
    // MARK: - IBActions
    @IBAction func muestraCategoriasACTION(_ sender: Any) {
        
    }
    
    @IBAction func guardarTareaACTION(_ sender: Any) {
        
    }
    
    @IBAction func buttonImageACTION(_ sender: Any) {
        GetPhotoHelper.muestraFotoMenu(delegate: self, viewController: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    
    private func configuracionUI() {
        self.title = "Nueva tarea"
        self.categoriaBTN.layer.cornerRadius = 16
        self.salvarDatosBTN.layer.cornerRadius = 16
        self.imagenTareaIV.layer.cornerRadius = self.imagenTareaIV.frame.width * 0.5
        self.imagenTareaIV.layer.borderWidth = 1.2
        self.imagenTareaIV.layer.borderColor = UIColor.red.cgColor
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        self.prioridadTF.inputView = pickerView
        self.prioridadTF.text = self.dataSourcePrioridad.first
        
        self.categoriaLBL.text = self.nombreCategoria
        self.nuevaTareaTF.delegate = self
    }
    
    //Funcionalidad para ocultar el teclado cuando tocas fuera del texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension NuevaTareaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //Código defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageUwr = info[.originalImage] as? UIImage {
            self.imagenTareaIV.image = imageUwr
            self.fotoSeccionada = true
        }
        
        //Código defensivo para evitar bloqueos en el hilo principal
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
}

extension NuevaTareaViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataSourcePrioridad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataSourcePrioridad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.prioridadTF.text = self.dataSourcePrioridad[row]
    }
}

extension NuevaTareaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

