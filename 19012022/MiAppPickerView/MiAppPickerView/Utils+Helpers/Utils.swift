//
//  Utils.swift
//  MiAppPickerView
//
//  Created by Carlos Carrera on 13/2/22.
//

import Foundation
import UIKit

class Utils {
    
    //Patrón Singleton
    static let shared = Utils()
    
    func configuracionPickerView(tag: Int,
                                 delegate: UIPickerViewDelegate,
                                 dataSource: UIPickerViewDataSource,
                                 textField: UITextField,
                                 dataArray: [String]) {
        
        //Creo un PickerView
        let pickerView = UIPickerView()
        pickerView.delegate = delegate
        pickerView.dataSource = dataSource
        pickerView.tag = tag
        
        //Le asigno el picker al textField y le asigno el valor inicial
        textField.inputView = pickerView
        textField.text = dataArray[0]
    }
    
}
