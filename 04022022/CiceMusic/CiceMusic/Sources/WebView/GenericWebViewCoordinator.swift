//
//  GenericWebViewCoordinator.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 29/3/22.
//

import Foundation

final class GenericWebViewCoordinator {
    
    static func navigation() -> UINavigationController {
        let navVC = UINavigationController(rootViewController: view())
        return navVC
    }
    
    static func view() -> UIViewController & GenericWebViewPresenterOutputProtocol {
        let vc = GenericWebViewController()
        vc.presenter = presenter(vc: vc)
        return vc
    }
    
    static func presenter(vc: GenericWebViewController) -> GenericWebViewPresenterInputProtocol {
        let presenter = GenericWebViewPresenter()
        presenter.viewController = vc
        return presenter
    }
}
