import Foundation

// Input del Interactor
protocol BooksInteractorInputProtocol {
    func fetchBookFromWebServiceInteractor()
}

final class BooksInteractor: BaseInteractor<BooksInteractorOutputProtocol> {
    
    let provider: BooksProviderInputProtocol = BooksProvider()
    
    func transformDataFromBookServerModelToArrayGenericResult(data: BookServerModel) -> [GenericResult] {
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
extension BooksInteractor: BooksInteractorInputProtocol {
    func fetchBookFromWebServiceInteractor() {
        self.provider.fetchBookFromWebServiceProvider { [weak self] (result) in
            guard self != nil else {return}
            switch result {
            case .success(let modelData):
                self?.presenter?.setDataFromWebInteractor(data: self?.transformDataFromBookServerModelToArrayGenericResult(data: modelData))
            case .failure(let error):
                self?.presenter?.setAlertMessage(error: error)
            }
        }
    }
}
