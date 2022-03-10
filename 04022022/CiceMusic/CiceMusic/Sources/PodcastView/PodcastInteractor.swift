import Foundation

// Input del Interactor
protocol PodcastInteractorInputProtocol {
    func fetchPodcastFromWebServiceInteractor()
}

final class PodcastInteractor: BaseInteractor<PodcastInteractorOutputProtocol> {
    
    let provider: PodcastProviderInputProtocol = PodcastProvider()
    
    func transformDataFromPodcastServerModelToArrayGenericResult(data: PodcastServerModel) -> [GenericResult] {
        var arrayGenericResult: [GenericResult] = []
        
        if let dataUnw = data.feed?.results {
            for item in dataUnw {
                let objc = GenericResult(artistName: item.artistName,
                                         id: item.id,
                                         name: item.name,
                                         kind: item.kind,
                                         artworkUrl100: item.artworkUrl100,
                                         url: item.url,
                                         releaseDate: nil)
                arrayGenericResult.append(objc)
            }
        }
        return arrayGenericResult
    }
    
}

// Input del Interactor
extension PodcastInteractor: PodcastInteractorInputProtocol {
    func fetchPodcastFromWebServiceInteractor() {
        self.provider.fetchPodcastFromWebServiceProvider { [weak self] (result) in
            guard self != nil else {return}
            switch result {
            case .success(let modelData):
                self?.presenter?.setDataFromWebInteractor(data: self?.transformDataFromPodcastServerModelToArrayGenericResult(data: modelData))
            case .failure(let error):
                self?.presenter?.setAlertMessage(error: error)
            }
        }
    }    
}
