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
        let vc = CategoriasViewCoordinator.view(delegate: self)
        self.show(vc, sender: nil)
    }
    
    @IBAction func guardarTareaACTION(_ sender: Any) {
        if validacionDatos() {
            
            if let imageData = self.imagenTareaIV.image?.jpegData(compressionQuality: 0.3) {
                SaveFavoritesPresenter.shared.addLocal(favorite: DownloadNewModel(pId: Int.random(in: 0..<999),
                                                                                  pNewTask: self.nuevaTareaTF.text ?? "",
                                                                                  pPriority: self.prioridadTF.text ?? "",
                                                                                  pTaskDate: self.fechaTF.text ?? "",
                                                                                  pTaskDescription: self.descripcionTV.text ?? "",
                                                                                  pTaskCategory: self.categoriaLBL.text ?? "",
                                                                                  pTaskImage: imageData)) { result in
                    if result != nil {
                        self.present(Utils.muestraAlerta(titulo: "Genial!",
                                                         mensaje: "Los datos se han salvado correctamente en Userdefault",
                                                         completionHandler: { _ in
                                                            //notification push local (deprecated)
                                                            let notification = UILocalNotification()
                                                            notification.fireDate = Date(timeIntervalSinceNow: 5)
                                                            notification.alertBody = self.nuevaTareaTF.text
                                                            notification.timeZone = NSTimeZone.default
                                                            notification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
                                                            UIApplication.shared.scheduleLocalNotification(notification)
                            
                                                            self.limpiarDatos()
                                                        }),
                                     animated: true,
                                     completion: nil)
                    }
                } failure: { error in
                    debugPrint(error ?? "")
                }

            }
            
        } else {
            self.present(Utils.muestraAlerta(titulo: "Hey!",
                                             mensaje: "Por favor rellena todos los campos y ten en cuenta seleccionar una fotografía de la tarea",
                                             completionHandler: nil),
                         animated: true,
                         completion: nil)
        }
    }
    
    @IBAction func buttonImageACTION(_ sender: Any) {
        GetPhotoHelper.muestraFotoMenu(delegate: self, viewController: self)
    }
    
    @IBAction func muestraDatePickerACTION(_ sender: UITextField) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
    }
    
    //Funcionalidad para ocultar el teclado cuando tocas fuera del texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
    
    @objc
    func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.fechaTF.text = dateFormatter.string(from: sender.date)
    }
    
    private func validacionDatos() -> Bool {
        return !(self.nuevaTareaTF.text?.isEmpty ?? false)
            && !(self.prioridadTF.text?.isEmpty ?? false)
            && !(self.fechaTF.text?.isEmpty ?? false)
            && !(self.descripcionTV.text?.isEmpty ?? false)
            && !(self.categoriaLBL.text?.isEmpty ?? false)
            && self.fotoSeccionada
    }
    
    private func limpiarDatos(){
        self.nuevaTareaTF.text = ""
        self.prioridadTF.text = ""
        self.fechaTF.text = ""
        self.descripcionTV.text = "Coloca una breve descripción de tu tarea"
        self.categoriaLBL.text = self.nombreCategoria
        self.imagenTareaIV.image = UIImage(named: Constants.imagePlaceholder)
        self.fotoSeccionada = false
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

extension NuevaTareaViewController : CategoriaViewControllerDelegate {
    func nombreCategoriaSeleccionada(categoria: String){
        self.categoriaLBL.text = categoria
    }
}
