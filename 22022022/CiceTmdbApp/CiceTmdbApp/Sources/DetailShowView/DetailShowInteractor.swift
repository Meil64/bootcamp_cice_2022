import Foundation

//Input del Interactor
protocol DetailShowInteractorInputProtocol: BaseInteractorInputProtocol {
    
}

//Output del Provider
protocol DetailShowProviderOutputProtocol: BaseProviderOutputProtocol {

}

final class DetailShowInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: DetailShowInteractorOutputProtocol? {
        super.baseViewModel as? DetailShowInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: DetailShowProviderInputProtocol? {
        super.baseProvider as? DetailShowProviderInputProtocol
    }
    
    
}

//Input del Interactor
extension DetailShowInteractor: DetailShowInteractorInputProtocol {
    
}

//Output del Provider
extension DetailShowInteractor: DetailShowProviderOutputProtocol {
    
}
