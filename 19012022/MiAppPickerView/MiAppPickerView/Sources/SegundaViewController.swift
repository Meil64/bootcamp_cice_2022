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
    let dataSourcePrioridadesTeletrabajo = ["Alta", "Media", "Baja", "Muy baja"]
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
        
        //Imagen por defecto
        self.perfilIV.image = UIImage(named: self.dataSourceFotosPerfil[0])
        
        Utils.shared.configuracionPickerView(tag: 1,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.localidadesTF,
                                             dataArray: self.dataSourceLocalidades)
        Utils.shared.configuracionPickerView(tag: 2,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.codigoPostalTF,
                                             dataArray: self.dataSourceCPs)
        Utils.shared.configuracionPickerView(tag: 3,
                                             delegate: self,
                                             dataSource: self,
                                             textField: self.prioridadTeletrabajoTF,
                                             dataArray: self.dataSourcePrioridadesTeletrabajo)
    }
    
}

extension SegundaViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag{
        case 1:
            return self.dataSourceLocalidades[row]
        case 2:
            return self.dataSourceCPs[row]
        default:
            return self.dataSourcePrioridadesTeletrabajo[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag{
        case 1:
            self.localidadesTF.text = self.dataSourceLocalidades[row]
        case 2:
            self.codigoPostalTF.text = self.dataSourceCPs[row]
        default:
            self.prioridadTeletrabajoTF.text = self.dataSourcePrioridadesTeletrabajo[row]
            self.perfilIV.image = UIImage(named: self.dataSourceFotosPerfil[row])
        }
    }
    
}

extension SegundaViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag{
        case 1:
            return self.dataSourceLocalidades.count
        case 2:
            return self.dataSourceCPs.count
        default:
            return self.dataSourcePrioridadesTeletrabajo.count
        }
    }
}
