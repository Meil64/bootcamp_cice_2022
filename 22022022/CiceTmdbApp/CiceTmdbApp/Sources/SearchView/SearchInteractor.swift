import Foundation

//Input del Interactor
protocol SearchInteractorInputProtocol: BaseInteractorInputProtocol {
    
}

//Output del Provider
protocol SearchProviderOutputProtocol: BaseProviderOutputProtocol {

}

final class SearchInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: SearchInteractorOutputProtocol? {
        super.baseViewModel as? SearchInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: SearchProviderInputProtocol? {
        super.baseProvider as? SearchProviderInputProtocol
    }
    
    
}

//Input del Interactor
extension SearchInteractor: SearchInteractorInputProtocol {
    
}

//Output del Provider
extension SearchInteractor: SearchProviderOutputProtocol {
    
}
