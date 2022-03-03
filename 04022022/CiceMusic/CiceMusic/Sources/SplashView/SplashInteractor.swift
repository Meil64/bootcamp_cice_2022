//
//  SplashInteractor.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 2/3/22.
//

import Foundation

// Input del Interactor
protocol SplashInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor()
}

final class SplashInteractor: BaseInteractor<SplashInteractorOutputProtocol> {
    
}

// Input del Interactor
extension SplashInteractor: SplashInteractorInputProtocol{
    func fetchDataFromWebServiceInteractor() {
        
    }
}
