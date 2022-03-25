import Foundation

// Input del Presenter
protocol LoginPresenterInputProtocol {
    func showCustomAlertFailure()
    func showCustomAlertSuccess()
}

// Output del Interactor
protocol LoginInteractorOutputProtocol {
    
}

final class LoginPresenter: BasePresenter<LoginPresenterOutputProtocol, LoginInteractorInputProtocol, LoginRouterInputProtocol> {
    
    var dataModel: LoginCoordinatorDTO?
    
}

// Input del Presenter
extension LoginPresenter: LoginPresenterInputProtocol {    
    func showCustomAlertFailure(){
        self.router?.showCustomAlert(delegate: self, model: CustomAlertManager.init(type: .failureLogin))
    }
    
    func showCustomAlertSuccess(){
        self.router?.showCustomAlert(delegate: self, model: CustomAlertManager.init(type: .successLogin))
    }
}

// Output del Interactor
extension LoginPresenter: LoginInteractorOutputProtocol {
    
}

extension LoginPresenter: AlertDefaultViewControllerDelegate {
    func leftButtonPressed() {
        
    }
    
    func rightButtonPressed() {
        guard let menuResponseUnw = self.dataModel?.dataModel else {return}
        self.router?.showHomeTabBar(data: menuResponseUnw)
    }
}
