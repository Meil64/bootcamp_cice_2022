//
//  TerceraViewController.swift
//  MiDataNavigation
//
//  Created by Carlos Carrera on 13/2/22.
//

import UIKit

class TerceraViewController: UIViewController {

    // MARK: - Variables
    var datosUsuario = DatosUsuarioModel()
    let dataSourceCodigoPostal = ["28001", "38002", "48003", "58004"]
    let dataSourceCiudad = ["Badrid", "Marcelona", "Varagoza", "Textremadura"]
    let dataSourceGeoposition = ["40.123", "-3.4321", "3.46123", "-45.8763"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var miNombreLBL: UILabel!
    @IBOutlet weak var miApellidoLBL: UILabel!
    @IBOutlet weak var miTelefonoLBL: UILabel!
    @IBOutlet weak var miDireccionLBL: UILabel!
    @IBOutlet weak var edadPerroLBL: UILabel!
    
    @IBOutlet weak var codigoPostalTF: UITextField!
    @IBOutlet weak var ciudadTF: UITextField!
    @IBOutlet weak var coordenadasTF: UITextField!
    
    // MARK: - IBActions
    @IBAction func muestraCuartaVentanaACTION(_ sender: UIButton) {
        
    }    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
    }
    
    private func configuracionUI() {
        self.miNombreLBL.text = "Mi nombre es: \(self.datosUsuario.nombreData ?? "")"
        self.miApellidoLBL.text = "Mi apellido es: \(self.datosUsuario.apellidoData ?? "")"
        self.miTelefonoLBL.text = "Mi teléfono es: \(self.datosUsuario.telefonoData ?? "")"
        self.miDireccionLBL.text = "Mi dirección es: \(self.datosUsuario.direccionData ?? "")"
        self.edadPerroLBL.text = "Mi edadPerro es: \(self.datosUsuario.edadPerroData ?? "")"
        
        Utils.shared.configuracionPickerView(tag: 1,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.codigoPostalTF)
        Utils.shared.configuracionPickerView(tag: 2,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.ciudadTF)
        Utils.shared.configuracionPickerView(tag: 3,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.coordenadasTF)
    }
    
    private func configuracionPickerView(){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueV4" {
            if (Utils.shared.checkTextFields(textos: [self.codigoPostalTF, self.ciudadTF, self.coordenadasTF])){
                datosUsuario.cpData = self.codigoPostalTF.text
                datosUsuario.ciudadData = self.ciudadTF.text
                datosUsuario.geoposicionData = self.coordenadasTF.text
                
                let ventana4VC = segue.destination as? CuartaViewController
                ventana4VC?.datosUsuario = self.datosUsuario
                
            } else {
                self.present(Utils.shared.showAlertVC(
                    title: "Heyeee",
                    message: "Debes rellenar los campos para continuar"),
                     animated: true,
                     completion: nil)
            }
        }
    }
}

extension TerceraViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1:
            return self.dataSourceCodigoPostal[row]
        case 2:
            return self.dataSourceCiudad[row]
        default:
            return self.dataSourceGeoposition[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 1:
            self.codigoPostalTF.text = self.dataSourceCodigoPostal[row]
        case 2:
            self.ciudadTF.text = self.dataSourceCiudad[row]
        default:
            self.coordenadasTF.text = self.dataSourceGeoposition[row]
        }
    }
}

extension TerceraViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 1:
            return self.dataSourceCodigoPostal.count
        case 2:
            return self.dataSourceCiudad.count
        default:
            return self.dataSourceGeoposition.count
        }
    }
}
