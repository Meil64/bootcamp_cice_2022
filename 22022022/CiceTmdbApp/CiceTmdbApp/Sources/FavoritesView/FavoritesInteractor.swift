import Foundation

//Input del Interactor
protocol FavoritesInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataFromDBInteractor()
}

//Output del Provider
protocol FavoritesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationFavorites(completion: Result<DetailMovieServerModel, NetworkError>)
}

final class FavoritesInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: FavoritesInteractorOutputProtocol? {
        super.baseViewModel as? FavoritesInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: FavoritesProviderInputProtocol? {
        super.baseProvider as? FavoritesProviderInputProtocol
    }
    
    func transformToArrayFavorites(data: DetailMovieServerModel?) -> [MoviesTVModel]? {
        var dataSource: [MoviesTVModel] = []
        if dataSource.count >= 0 {
            let obj = MoviesTVModel(id: data?.id,
                                    backdropPath: data?.backdropPath,
                                    posterPath: data?.posterPath,
                                    title: data?.title)
            dataSource.append(obj)
        }
        return dataSource
    }
    
}

//Input del Interactor
extension FavoritesInteractor: FavoritesInteractorInputProtocol {
    func fetchDataFromDBInteractor() {
        self.provider?.fetchDataFromDBProvider()
    }
}

//Output del Provider
extension FavoritesInteractor: FavoritesProviderOutputProtocol {
    func setInformationFavorites(completion: Result<DetailMovieServerModel, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoFavoritesViewModel(data: self.transformToArrayFavorites(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
}
