import Foundation

// Input del Interactor
protocol MusicInteractorInputProtocol {
    func transformDataFromInteractor()
}

final class MusicInteractor: BaseInteractor<MusicInteractorOutputProtocol> {
    
    // ID
    let provider: MusicProviderInputProtocol = MusicProvider()
    
    //MARK: - Variables globales
    var data: MusicCoordinatorDTO?
    
    func transformDataFromMusicServerModelToArrayGenericResult(data: MusicServerModel) -> [GenericResult] {
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
extension MusicInteractor: MusicInteractorInputProtocol {
    
    func transformDataFromInteractor(){
        self.provider.fetchData { (result) in
            switch result {
            case .success(let modelData):
                self.presenter?.dataTransformedFromInteractor(data: self.transformDataFromMusicServerModelToArrayGenericResult(data: modelData))
            case .failure(let error):
                self.presenter?.setAlertMessage(error: error)
            }
        }
    }
    
}
