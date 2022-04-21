import Foundation


// Output del Interactor
protocol DetailShowInteractorOutputProtocol: BaseInteractorOutputProtocol {
    
}

final class DetailShowViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: DetailShowInteractorInputProtocol?{
        super.baseInteractor as? DetailShowInteractorInputProtocol
    }
    
    //MARK: - Variables @Published

    
    //MARK: - Métodos públicos para View
    func fetchData() {

    }
    
}

// Output del Interactor
extension DetailShowViewModel: DetailShowInteractorOutputProtocol {
    
}
