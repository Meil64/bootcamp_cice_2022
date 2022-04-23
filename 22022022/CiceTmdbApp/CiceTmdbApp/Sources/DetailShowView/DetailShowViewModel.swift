import Foundation


// Output del Interactor
protocol DetailShowInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationDetailShow(data: DetailShowServerModel?)
}

final class DetailShowViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: DetailShowInteractorInputProtocol?{
        super.baseInteractor as? DetailShowInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var data: DetailShowServerModel?
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataDetailShowInteractor()
    }
    
}

// Output del Interactor
extension DetailShowViewModel: DetailShowInteractorOutputProtocol {
    func setInformationDetailShow(data: DetailShowServerModel?){
        guard let dataUnw = data else {
            return
        }
        self.data = dataUnw
    }
}
