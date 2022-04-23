import Foundation
import Combine

// Input Protocol
protocol DetailShowProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailShowProvider()
}

final class DetailShowProvider : BaseProvider{
    
    //MARK: - DI
    weak var interactor: DetailShowProviderOutputProtocol? {
        super.baseInteractor as? DetailShowProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var dataDTO: DetailShowCoordinatorDTO?
    
}

extension DetailShowProvider: DetailShowProviderInputProtocol {
    
    func fetchDataDetailShowProvider() {
        self.networkService.requestGeneric(payloadRequest: DetailShowRequestDTO.requestDataDetail(idShow: "\(dataDTO?.dataID ?? 0)",
                                                                                                   moreParams: "credits,videos"),
                                           entityClass: DetailShowServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationDetailShow(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationDetailShow(completion: .success(resultData))
            }
            .store(in: &cancellable)
    }
    
}

//MARK: - Request de apoyo
struct DetailShowRequestDTO {
    
    static func requestDataDetail(idShow: String, moreParams: String) -> RequestDTO {
        let argument: [CVarArg] = [idShow, moreParams]
        let urlComplete = String(format: URLEndpoint.endpointShowDetail, arguments: argument)
        print(urlComplete)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
