//
//  PrefsHelper.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import Foundation
import UIKit

class PrefsHelper {
    
    private static let kUsername = "USERNAME"
    private static let kPassword = "PASSWORD"
    private static let kUsuarioLogado = "LOGADO"
    private static let kImageProfile = "IMAGE_PROFILE"
    private static let kPrefs = UserDefaults.standard
    
    static func saveLoginData(username: String?, password: String?) {
        kPrefs.setValue(username, forKey: kUsername)
        kPrefs.setValue(password, forKey: kPassword)
        kPrefs.setValue(true, forKey: kUsuarioLogado)
    }
    
    static func isUsuarioLogado() -> Bool {
        return kPrefs.bool(forKey: kUsuarioLogado)
    }
    
    static func getSavedImage() -> UIImage? {
        if let imageData = kPrefs.data(forKey: kImageProfile){
            return UIImage(data: imageData)
        } else {
            return nil
        }
    }
    
    static func saveImage(image: UIImage) {
        let imageData = image.jpegData(compressionQuality: 0.5)
        kPrefs.setValue(imageData, forKey: kImageProfile)
    }
}
