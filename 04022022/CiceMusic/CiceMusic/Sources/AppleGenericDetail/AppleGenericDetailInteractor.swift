import Foundation

// Input del Interactor
protocol AppleGenericDetailInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor()
}

final class AppleGenericDetailInteractor: BaseInteractor<AppleGenericDetailInteractorOutputProtocol> {
    
    let provider: AppleGenericDetailProviderInputProtocol = AppleGenericDetailProvider()
    
    func transformDataFromAppsServerModelToArrayGenericResult(data: AppServerModel) -> [GenericResult] {
        var arrayGenericResult: [GenericResult] = []
        
        if let dataUnw = data.feed?.results {
            for item in dataUnw {
                let objc = GenericResult(artistName: item.artistName,
                                         id: item.id,
                                         name: item.name,
                                         kind: item.kind,
                                         artworkUrl100: item.artworkUrl100,
                                         url: item.url,
                                         releaseDate: item.releaseDate)
                arrayGenericResult.append(objc)
            }
        }
        return arrayGenericResult
    }
    
}

// Input del Interactor
extension AppleGenericDetailInteractor: AppleGenericDetailInteractorInputProtocol {
    func fetchDataFromWebServiceInteractor(){
        self.provider.fetchData { [weak self] (result) in
            guard self != nil else {return}
            switch result{
            case let .success(model):
                self?.presenter?.setDataFromWebInteractor(data: self?.transformDataFromAppsServerModelToArrayGenericResult(data: model))
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
