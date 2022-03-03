//
//  SplashViewController.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 2/3/22.
//

import UIKit

// Output del Presenter
protocol SplashPresenterOutputProtocol {
    
}

class SplashViewController: BaseView<SplashPresenterInputProtocol> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.fetchDataFromWebService()

        // Do any additional setup after loading the view.
    }
}

// Output del Presenter
extension SplashViewController: SplashPresenterOutputProtocol {
    
}
