import Foundation

// Input del Interactor
protocol LoginInteractorInputProtocol {
    
}

final class LoginInteractor: BaseInteractor<LoginInteractorOutputProtocol> {
    
    let provider: LoginProviderInputProtocol = LoginProvider()
    
}

// Input del Interactor
extension LoginInteractor: LoginInteractorInputProtocol {
    
}
