//
//  GenericWebViewPresenter.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 29/3/22.
//

import Foundation

protocol GenericWebViewPresenterInputProtocol {
    
}

final class GenericWebViewPresenter {
    var viewController: GenericWebViewPresenterOutputProtocol?
}

extension GenericWebViewPresenter: GenericWebViewPresenterInputProtocol{
    
}

