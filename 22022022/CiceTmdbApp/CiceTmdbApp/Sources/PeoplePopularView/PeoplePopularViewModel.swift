import Foundation


// Output del Interactor
protocol PeoplePopularInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationPeoplePopular(data: [PeopleModel]?)
}

final class PeoplePopularViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: PeoplePopularInteractorInputProtocol?{
        super.baseInteractor as? PeoplePopularInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var dataPeople: [PeopleModel] = []
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataPeoplePopularInteractor()
    }
    
}

// Output del Interactor
extension PeoplePopularViewModel: PeoplePopularInteractorOutputProtocol {
    func setInformationPeoplePopular(data: [PeopleModel]?) {
        guard let dataUnw = data else { return }
        self.dataPeople.removeAll()
        self.dataPeople = dataUnw
    }
}
