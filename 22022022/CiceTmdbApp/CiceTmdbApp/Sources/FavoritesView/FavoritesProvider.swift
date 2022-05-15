import Foundation
import Combine

// Input Protocol
protocol FavoritesProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataFromDBProvider()
}

final class FavoritesProvider : BaseProvider{
    
    //MARK: - DI
    weak var interactor: FavoritesProviderOutputProtocol? {
        super.baseInteractor as? FavoritesProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    
    func getMovieFromDB(completionHandler: @escaping (DownloadNewModels?) -> ()) {
        DDBB.shared.getAllLocal { results in
            completionHandler(results)
        } failure: { error in
            debugPrint(error ?? "")
        }
    }
    
}

extension FavoritesProvider: FavoritesProviderInputProtocol {
    
    func fetchDataFromDBProvider() {
        self.getMovieFromDB { results in
            results?.downloads.map { item in
                item.map { itemX in
                    self.networkService.requestGeneric(payloadRequest: FavoritesRequestDTO.requestData(movieId: itemX.id,
                                                                                                       supportParameters: "videos,credits"),
                                                       entityClass: DetailMovieServerModel.self)
                        .sink { [weak self] completion in
                            guard self != nil else { return }
                            switch completion {
                            case .finished:
                                debugPrint("finished")
                            case let .failure(error):
                                debugPrint(error)
                                self?.interactor?.setInformationFavorites(completion: .failure(error))
                            }
                        } receiveValue: { [weak self] resultData in
                            guard self != nil else { return }
                            debugPrint(resultData)
                            self?.interactor?.setInformationFavorites(completion: .success(resultData))
                        }
                        .store(in: &self.cancellable)
                }
                
            }
        }
    }
}

//MARK: - Request de apoyo
struct FavoritesRequestDTO {
    
    static func requestData(movieId: String, supportParameters: String) -> RequestDTO {
        let argument: [CVarArg] = [movieId, supportParameters]
        let urlComplete = String(format: URLEndpoint.endpointMovieDetail, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
    
}
