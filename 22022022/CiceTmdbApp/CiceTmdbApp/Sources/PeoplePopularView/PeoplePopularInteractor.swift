import Foundation

//Input del Interactor
protocol PeoplePopularInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataPeoplePopularInteractor()
}

//Output del Provider
protocol PeoplePopularProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationPeoplePopular(completion: Result<PeoplePopularServerModel?, NetworkError>)
}

final class PeoplePopularInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: PeoplePopularInteractorOutputProtocol? {
        super.baseViewModel as? PeoplePopularInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: PeoplePopularProviderInputProtocol? {
        super.baseProvider as? PeoplePopularProviderInputProtocol
    }
    
    func transformPeopleDataToModel(data: PeoplePopularServerModel?) -> [PeopleModel]? {
        var datasourcePeopleModel: [PeopleModel] = []
        guard let dataUnw = data?.results else { return nil }
        for i in 0..<dataUnw.count {
            datasourcePeopleModel.append(PeopleModel.fromServerModel(data: dataUnw[i]))
        }
        return datasourcePeopleModel
    }
    
}

//Input del Interactor
extension PeoplePopularInteractor: PeoplePopularInteractorInputProtocol {
    func fetchDataPeoplePopularInteractor() {
        self.provider?.fetchDataPeoplePopularProvider()
    }
}

//Output del Provider
extension PeoplePopularInteractor: PeoplePopularProviderOutputProtocol {
    func setInformationPeoplePopular(completion: Result<PeoplePopularServerModel?, NetworkError>){
        switch completion {
        case .success(let data):
            self.viewModel?.setInformationPeoplePopular(data: self.transformPeopleDataToModel(data: data))
        case let .failure(error):
            debugPrint(error)
        }
    }
}
