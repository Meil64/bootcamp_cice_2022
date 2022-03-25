//
//  CustomAlertManager.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 23/3/22.
//

import Foundation
enum DefaultAlertType: Int {
    case none
    case successLogin
    case failureLogin
}

struct CustomAlertManager {
    var type: DefaultAlertType?
    
    //General Buttons
    var leftButton = LocalizedKeys.General.cancel
    var rightButton = LocalizedKeys.General.accept
    
    //Success Login
    var successLoginTitle = LocalizedKeys.Login.successTitle
    var successLoginMessage = LocalizedKeys.Login.successMessage
    
    //Failure Login
    var failureLoginTitle = LocalizedKeys.Login.failureTitle
    var failureLoginMessage = LocalizedKeys.Login.failureMessage
    
    init(type: DefaultAlertType) {
        self.type = type
    }
}
