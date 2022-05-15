import Foundation
import Combine

// Input Protocol
protocol DetailMovieProviderInputProtocol: BaseProviderInputProtocol {
    func fetchDataDetailMovieProvider()
    func saveDataAsFavoritesProvider()
    func removeDataFromFavoritesProvider()
}

final class DetailMovieProvider : BaseProvider{
    
    //MARK: - DI
    weak var interactor: DetailMovieProviderOutputProtocol? {
        super.baseInteractor as? DetailMovieProviderOutputProtocol
    }
    
    let networkService: NetworkServiceInputProtocol = NetworkService()
    var cancellable: Set<AnyCancellable> = []
    var dataDTO: DetailMovieCoordinatorDTO?
    
}

extension DetailMovieProvider: DetailMovieProviderInputProtocol {
    
    func fetchDataDetailMovieProvider() {
        self.networkService.requestGeneric(payloadRequest: DetailMovieRequestDTO.requestDataDetail(idMovie: "\(dataDTO?.dataID ?? 0)",
                                                                                                   moreParams: "credits,videos"),
                                           entityClass: DetailMovieServerModel.self)
            .sink { [weak self] completion in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    debugPrint("finished")
                case let .failure(error):
                    self?.interactor?.setInformationDetailMovie(completion: .failure(error))
                }
            } receiveValue: { [weak self] resultData in
                guard self != nil else { return }
                self?.interactor?.setInformationDetailMovie(completion: .success(resultData))
            }
            .store(in: &cancellable)
    }
    
    func saveDataAsFavoritesProvider(){
        DDBB.shared.addLocal(favorite: DownloadNewModel(pId: "\(self.dataDTO?.dataID ?? 0)")) { result in
            debugPrint("salvado correctamente")
        } failure: { error in
            debugPrint("Error intentando guardar: \(error ?? "")")
        }
    }
    
    func removeDataFromFavoritesProvider(){
        DDBB.shared.deleteLocal(favorite: DownloadNewModel(pId: "\(self.dataDTO?.dataID ?? 0)")) { result in
            debugPrint("borrado correctamente")
        } failure: { error in
            debugPrint("Error intentando borrar: \(error ?? "")")
        }
    }
}

//MARK: - Request de apoyo
struct DetailMovieRequestDTO {
    
    static func requestDataDetail(idMovie: String, moreParams: String) -> RequestDTO {
        let argument: [CVarArg] = [idMovie, moreParams]
        let urlComplete = String(format: URLEndpoint.endpointMovieDetail, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
}
