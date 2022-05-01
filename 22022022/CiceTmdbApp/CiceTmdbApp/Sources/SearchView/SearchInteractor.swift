import Foundation

//Input del Interactor
protocol SearchInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataSearchMovieInteractor(query: String)
}

//Output del Provider
protocol SearchProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationSearchMovies(completion: Result<[MovieApiResult]?, NetworkError>)
}

final class SearchInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: SearchInteractorOutputProtocol? {
        super.baseViewModel as? SearchInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: SearchProviderInputProtocol? {
        super.baseProvider as? SearchProviderInputProtocol
    }
    
    func getMoviesTVModelViewFromData(data: [MovieApiResult]?) -> [MoviesTVModel]? {
        var datasourceMoviesTV: [MoviesTVModel] = []
        if let dataUnw = data {
            for i in 0..<dataUnw.count {
                let object = MoviesTVModel(id: dataUnw[i].id,
                                               backdropPath: dataUnw[i].backdropPath,
                                               posterPath: dataUnw[i].posterPath,
                                               title: dataUnw[i].title)
                datasourceMoviesTV.append(object)
            }
        }
        return datasourceMoviesTV
    }
    
}

//Input del Interactor
extension SearchInteractor: SearchInteractorInputProtocol {
    func fetchDataSearchMovieInteractor(query: String) {
        self.provider?.fetchDataSearchMovieProvider(query: query)
    }
}

//Output del Provider
extension SearchInteractor: SearchProviderOutputProtocol {
    
    func setInformationSearchMovies(completion: Result<[MovieApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoSearchMoviesViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
