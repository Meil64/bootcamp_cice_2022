import Foundation
import Combine

// Input Protocol
protocol SearchProviderInputProtocol: BaseProviderInputProtocol {
    
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
    
    /*
     //-> Este método nos muestra la forma de suscripción del método al AnyPublisher
     
    func fetchDataNowPlayingProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEnpoint.endpointMoviesNowPlaying,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationNowPlaying(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationNowPlaying(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
     */
    
}

//MARK: - Request de apoyo
struct SearchRequestDTO {
    
    /*
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
    */
}
