//
//  ViewController.swift
//  MiAppPickerView
//
//  Created by Carlos Carrera on 8/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables globales
    //let porque va a ser constante
    //Los nombres coinciden con los de los Assets.xcassets
    let quesosArrayData = ["Mozzarella", "Gorgonzola", "Provolone", "Stilton", "Asiago"]
    
    let quesosTextArrayData = [
        "La mozzarella (del italiano antiguo mozzare ‘cortar’) es un tipo de queso originario de la cocina italiana. Existe una variante de este queso en Dinamarca, pero la tradición italiana es más antigua. La ciudad de origen de este queso fue Aversa (Caserta). La denominación de origen con protección europea es la Mozzarella di Bufala Campana, sin que haya solicitado Italia la protección del nombre mozzarella. El queso DOP se produce en las provincias de Caserta y Salerno y en algunos municipios de las provincias de Nápoles, Benevento, Latina y Foggia con leche de búfala. En la misma Italia y en otros países, como Argentina, Colombia, España, Paraguay, Perú, República Dominicana, Uruguay, se preparan mozzarellas con leche de vaca.",
        "Gorgonzola Texto",
        "Provolone Texto",
        "Stilton Texto",
        "Asiago Texto"]
    
    //MARK: - IBOutlets
    @IBOutlet weak var tituloQuesoLBL: UILabel!
    @IBOutlet weak var detalleTextQuesoTXV: UITextView!
    @IBOutlet weak var imagenQuesoImV: UIImageView!
    @IBOutlet weak var pickerQuesoPicV: UIPickerView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI()
        self.configuracionPickerView()
    }
    
    //MARK: - Metodos privados
    private func configuracionUI(){
        self.title = "Quesos del Mundo"
        self.tituloQuesoLBL.text = self.quesosArrayData.first
        self.detalleTextQuesoTXV.text = self.quesosTextArrayData.first
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData.first ?? "placeholder")
    }

    private func configuracionPickerView(){
        self.pickerQuesoPicV.delegate = self
        self.pickerQuesoPicV.dataSource = self
    }
}

//MARK: - extension -> UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.quesosArrayData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.tituloQuesoLBL.text = self.quesosArrayData[row]
        self.imagenQuesoImV.image = UIImage(named: self.quesosArrayData[row])
        self.detalleTextQuesoTXV.text = self.quesosTextArrayData[row]
    }
}

//MARK: - extension -> UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.quesosArrayData.count
    }
    
}
