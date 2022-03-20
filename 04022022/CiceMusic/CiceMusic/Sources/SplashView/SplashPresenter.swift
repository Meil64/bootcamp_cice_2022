//
//  SplashPresenter.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 2/3/22.
//

import Foundation

// Input del Presenter
protocol SplashPresenterInputProtocol {
    func fetchDataFromWebService()
    func showHomeTabBar()
}

// Output del Interactor
protocol SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [MenuResponse]?)
    func setAlertMessage(error: NetworkError)
}

final class SplashPresenter: BasePresenter<SplashPresenterOutputProtocol, SplashInteractorInputProtocol, SplashRouterInputProtocol> {
    
    var dataSourceViewModel: [MenuResponse] = []
    
}

// Input del presenter
extension SplashPresenter: SplashPresenterInputProtocol {
    func fetchDataFromWebService() {
        self.interactor?.fetchDataFromWebServiceInteractor()
    }
    
    func showHomeTabBar() {
        self.router?.showHomeTabBarRouter(dataSource: self.dataSourceViewModel)
    }
}

// Output del Interactor
extension SplashPresenter: SplashInteractorOutputProtocol {
    func setDataFromWebInteractor(data: [MenuResponse]?) {
        guard let dataUnw = data else {return}
        self.dataSourceViewModel.removeAll()
        self.dataSourceViewModel = dataUnw
        self.viewController?.launchAnimation()
    }
    
    func setAlertMessage(error: NetworkError) {
        self.router?.showAlert(title: error.description, message: error.localizedDescription)
    }
}
