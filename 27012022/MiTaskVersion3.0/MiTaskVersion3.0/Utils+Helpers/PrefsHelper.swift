//
//  PrefsHelper.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import Foundation

class PrefsHelper {
    
    private static let kUsername = "USERNAME"
    private static let kPassword = "PASSWORD"
    private static let kUsuarioLogado = "LOGADO"
    private static let kPrefs = UserDefaults.standard
    
    static func saveLoginData(username: String?, password: String?) {
        kPrefs.setValue(username, forKey: kUsername)
        kPrefs.setValue(password, forKey: kPassword)
        kPrefs.setValue(true, forKey: kUsuarioLogado)
    }
    
    static func isUsuarioLogado() -> Bool {
        return kPrefs.bool(forKey: kUsuarioLogado)
    }
}
