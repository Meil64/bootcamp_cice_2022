import UIKit

// Output del presenter
protocol LoginPresenterOutputProtocol {
    func reloadInformationInView()
}

class LoginViewController: BaseView<LoginPresenterInputProtocol> {
    
    // MARK: - IBOutlets
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var contentViewUsername: UIView!
    @IBOutlet weak var contentViewPassword: UIView!
    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var togglePasswordBTN: UIButton!
    
    @IBAction func rememberMeACTION(_ sender: Any) {
        if datosCompletados() {
            UserDefaultsHelper.saveLoginData(username: self.usernameTF.text,
                                      password: self.passwordTF.text)
            self.configuracionUI(color: #colorLiteral(red: 0.2827598444, green: 1, blue: 0.25824927, alpha: 1))
        } else {
            self.presenter?.showCustomAlertFailure()
        }
    }
    
    @IBAction func loginACTION(_ sender: Any) {
        if datosCompletados() {
            self.navegarHomeTabBar()
        } else {
            self.presenter?.showCustomAlertFailure()
        }
    }
    
    @IBAction func togglePasswordACTION(_ sender: Any) {
        self.passwordTF.isSecureTextEntry = !self.passwordTF.isSecureTextEntry
        if(self.passwordTF.isSecureTextEntry) {
            togglePasswordBTN.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            togglePasswordBTN.setImage(UIImage(systemName: "eye.slash"), for: .normal)
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
        self.presenter?.showCustomAlertSuccess()
    }
    
    //Funcionalidad para ocultar el teclado cuando tocas fuera del texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

// Output del Presenter
extension LoginViewController: LoginPresenterOutputProtocol {

    func reloadInformationInView() {
        
    }
}
