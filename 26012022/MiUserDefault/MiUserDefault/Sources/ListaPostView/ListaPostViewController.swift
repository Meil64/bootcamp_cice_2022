//
//  ListaPostViewController.swift
//  MiUserDefault
//
//  Created by Carlos Carrera on 19/2/22.
//

import UIKit

class ListaPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionLogout()
        // Do any additional setup after loading the view.
    }

    private func configuracionLogout() {
        let button1 = UIBarButtonItem(image: UIImage(systemName: "house"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(logout))
        self.navigationItem.rightBarButtonItem = button1
    }
    
    @objc
    func logout() {
        Utils.Constants().kPrefs.setValue(false, forKey: Utils.Constants().kUserLogado)
        
        let vc = RegistroCoordinator.view()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
