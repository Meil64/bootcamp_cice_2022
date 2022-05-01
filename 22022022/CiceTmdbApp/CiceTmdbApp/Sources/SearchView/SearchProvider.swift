import Foundation
import Combine

// Input Protocol
protocol SearchProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataSearchMovieProvider(query: String)
}

final class SearchProvider : BaseProvider{
    
    //MARK: - DI
    weak var interactor: SearchProviderOutputProtocol? {
        super.baseInteractor as? SearchProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension SearchProvider: SearchProviderInputProtocol {
    
    func fetchDataSearchMovieProvider(query: String) {
        self.networkService.requestGeneric(payloadRequest: SearchRequestDTO.requestData(query: query),
                                           entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationSearchMovies(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationSearchMovies(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
}

//MARK: - Request de apoyo
struct SearchRequestDTO {
    
    static func requestData(query: String) -> RequestDTO {
        let argument: [CVarArg] = [query]
        let urlComplete = String(format: URLEndpoint.endpointSearchMovie, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
