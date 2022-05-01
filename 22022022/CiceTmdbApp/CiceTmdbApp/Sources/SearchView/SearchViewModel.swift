import Foundation


// Output del Interactor
protocol SearchInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class SearchViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: SearchInteractorInputProtocol?{
        super.baseInteractor as? SearchInteractorInputProtocol
    }
    
    //MARK: - Variables @Published

    
    //MARK: - Métodos públicos para View
    func fetchData() {

    }
    
}

// Output del Interactor
extension SearchViewModel: SearchInteractorOutputProtocol {
    
}
