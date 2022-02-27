//
//  GetPhotoHelper.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 27/2/22.
//

import Foundation
import UIKit

class GetPhotoHelper {
    
    static func muestraFotoMenu(delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate, viewController: UIViewController) {
        
        //Si la cámara está disponible
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            //Creo menú con las opciones de Cancelar, Camera y Library
            let actionSheetVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            actionSheetVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
            actionSheetVC.addAction(UIAlertAction(title: "Tomar foto", style: .default, handler: {
                _ in viewController.present(tomaFoto(delegate: delegate), animated: true, completion: nil)}))
            actionSheetVC.addAction(UIAlertAction(title: "Escoge de la biblioteca", style: .default, handler: {
                _ in viewController.present(muestraFotoLibrary(delegate: delegate), animated: true, completion: nil)}))
            
            //Muestro el menú
            viewController.present(actionSheetVC, animated: true, completion: nil)
            
        } else {
            
            //Muestro directamente la Library
            viewController.present(muestraFotoLibrary(delegate: delegate), animated: true, completion: nil)
            
        }
    }
    
    private static func muestraFotoLibrary(delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = delegate
        imagePicker.allowsEditing = true
        return imagePicker
    }
    
    private static func tomaFoto(delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = delegate
        imagePicker.allowsEditing = true
        return imagePicker
    }
}
