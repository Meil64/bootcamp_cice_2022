//
//  LoginViewController.swift
//  MiTaskVersion3.0
//
//  Created by Carlos Carrera on 20/2/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var contentViewUsername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    
    @IBAction func rememberMeACTION(_ sender: Any) {
        if datosCompletados() {
            PrefsHelper.saveLoginData(username: self.usernameTF.text,
                                      password: self.passwordTF.text)
            self.configuracionUI(color: #colorLiteral(red: 0.2827598444, green: 1, blue: 0.25824927, alpha: 1))
        } else {
            self.present(Utils.muestraAlerta(titulo: "hey!",
                                             mensaje: "Rellena el username y el password",
                                             completionHandler: nil),
                        animated: true,
                        completion: nil)
        }
    }
    
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletados() {
            self.navegarHomeTabBar()
        } else {
            self.present(Utils.muestraAlerta(titulo: "hey!",
                                             mensaje: "Rellena el username y el password",
                                             completionHandler: nil),
                        animated: true,
                        completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuracionUI(color: #colorLiteral(red: 1, green: 0.2827598444, blue: 0.25824927, alpha: 1))
        // Do any additional setup after loading the view.
    }
    
    private func configuracionUI(color: UIColor) {
        self.contentViewUsername.backgroundColor = .clear
        self.contentViewUsername.layer.cornerRadius = 37
        self.contentViewUsername.layer.borderWidth = 2
        self.contentViewUsername.layer.borderColor = color.cgColor
        
        self.contentViewPassword.backgroundColor = .clear
        self.contentViewPassword.layer.cornerRadius = 37
        self.contentViewPassword.layer.borderWidth = 2
        self.contentViewPassword.layer.borderColor = color.cgColor

        self.loginBTN.layer.cornerRadius = 22
    }
    
    private func datosCompletados() -> Bool {
        return !(self.usernameTF.text?.isEmpty ?? false) && !(self.passwordTF.text?.isEmpty ?? false)
    }

    private func borrarDatosFormulario() {
        self.usernameTF.text = ""
        self.passwordTF.text = ""
    }
    
    private func navegarHomeTabBar() {
        self.borrarDatosFormulario()
        let vc = HomeTabBarViewCoordinator.homeViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
