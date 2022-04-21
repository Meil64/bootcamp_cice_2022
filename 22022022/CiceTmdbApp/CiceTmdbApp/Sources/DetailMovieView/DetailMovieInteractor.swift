import Foundation

//Input del Interactor
protocol DetailMovieInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataDetailMovieInteractor()
}

//Output del Provider
protocol DetailMovieProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationDetailMovie(completion: Result<DetailMovieServerModel?, NetworkError>)
}

final class DetailMovieInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: DetailMovieInteractorOutputProtocol? {
        super.baseViewModel as? DetailMovieInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: DetailMovieProviderInputProtocol? {
        super.baseProvider as? DetailMovieProviderInputProtocol
    }
    
    
}

//Input del Interactor
extension DetailMovieInteractor: DetailMovieInteractorInputProtocol {
    func fetchDataDetailMovieInteractor(){
        self.provider?.fetchDataDetailMovieProvider()
    }
}

//Output del Provider
extension DetailMovieInteractor: DetailMovieProviderOutputProtocol {
    func setInformationDetailMovie(completion: Result<DetailMovieServerModel?, NetworkError>) {
        switch completion{
        case .success(let data):
            self.viewModel?.setInformationDetailMovie(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
