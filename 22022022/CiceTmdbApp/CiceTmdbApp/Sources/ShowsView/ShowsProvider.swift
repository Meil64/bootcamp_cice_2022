import Foundation
import Combine

// Input Protocol
protocol ShowsProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataAiringTodayProvider()
    func fetchDataOnTheAirProvider()
    func fetchDataPopularProvider()
    func fetchDataTopRatedProvider()
}

final class ShowsProvider : BaseProvider{
    
    //MARK: - DI
    weak var interactor: ShowsProviderOutputProtocol? {
        super.baseInteractor as? ShowsProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
}

extension ShowsProvider: ShowsProviderInputProtocol {
    
    func fetchDataAiringTodayProvider(){
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointShowsAiringToday,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: TVShowServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationAiringToday(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationAiringToday(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataOnTheAirProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointShowsOnTheAir,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: TVShowServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationOnTheAir(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationOnTheAir(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataPopularProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointShowsPopular,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: TVShowServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationPopular(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationPopular(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
    func fetchDataTopRatedProvider() {
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.endpointShowsTopRated,
                                 urlContext: .webService)
        self.networkService.requestGeneric(payloadRequest: request, entityClass: TVShowServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationTopRated(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationTopRated(completion: .success(resultData.results))
            }
            .store(in: &cancellable)
    }
    
}
