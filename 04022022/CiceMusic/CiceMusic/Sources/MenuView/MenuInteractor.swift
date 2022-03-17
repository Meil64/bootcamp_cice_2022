import Foundation

// Input del Interactor
protocol MenuInteractorInputProtocol {
    
}

final class MenuInteractor: BaseInteractor<MenuInteractorOutputProtocol> {
    
    let provider: MenuProviderInputProtocol = MenuProvider()
    
}

// Input del Interactor
extension MenuInteractor: MenuInteractorInputProtocol {
    
}
