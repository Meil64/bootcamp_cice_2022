import Foundation

//Input del Interactor
protocol DetailShowInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataDetailShowInteractor()
}

//Output del Provider
protocol DetailShowProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationDetailShow(completion: Result<DetailShowServerModel?, NetworkError>)
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
    func fetchDataDetailShowInteractor(){
        self.provider?.fetchDataDetailShowProvider()
    }
}

//Output del Provider
extension DetailShowInteractor: DetailShowProviderOutputProtocol {
    func setInformationDetailShow(completion: Result<DetailShowServerModel?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInformationDetailShow(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
