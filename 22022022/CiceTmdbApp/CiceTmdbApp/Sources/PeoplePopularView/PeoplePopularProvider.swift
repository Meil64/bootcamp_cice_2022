import Foundation
import Combine

// Input Protocol
protocol PeoplePopularProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataPeoplePopularProvider()
}

final class PeoplePopularProvider : BaseProvider{
    
    //MARK: - DI
    weak var interactor: PeoplePopularProviderOutputProtocol? {
        super.baseInteractor as? PeoplePopularProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension PeoplePopularProvider: PeoplePopularProviderInputProtocol {
    
    func fetchDataPeoplePopularProvider(){
        self.networkService.requestGeneric(payloadRequest: PeoplePopularRequestDTO.requestData(), entityClass: PeoplePopularServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationPeoplePopular(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationPeoplePopular(completion: .success(resultData))
            }
            .store(in: &cancellable)
    }
    
}

//MARK: - Request de apoyo
struct PeoplePopularRequestDTO {
    
    static func requestData() -> RequestDTO {
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.endpointPopularPeople, urlContext: .webService)
        return request
    }
    
}
