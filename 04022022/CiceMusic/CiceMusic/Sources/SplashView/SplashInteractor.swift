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
    
    let splashProvider: SplashProviderInputProtocol = SplashProvider()
    
}

// Input del Interactor
extension SplashInteractor: SplashInteractorInputProtocol{
    func fetchDataFromWebServiceInteractor() {
        self.splashProvider.fetchData { (result) in
            switch result {
            case .success(let modelData):
                self.presenter?.setDataFromWebInteractor(data: modelData.feed?.results)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}