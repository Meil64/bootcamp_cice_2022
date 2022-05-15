import Foundation


// Output del Interactor
protocol FavoritesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoFavoritesViewModel(data: [MoviesTVModel]?)
}

final class FavoritesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: FavoritesInteractorInputProtocol?{
        super.baseInteractor as? FavoritesInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    //MARK: - Variables
    @Published var dataSourceFavoriteMovies: [MoviesTVModel] = []
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataFromDBInteractor()
    }
    
}

// Output del Interactor
extension FavoritesViewModel: FavoritesInteractorOutputProtocol {
    func setInfoFavoritesViewModel(data: [MoviesTVModel]?) {
        self.dataSourceFavoriteMovies.removeAll()
        self.dataSourceFavoriteMovies = data ?? []
    }
}
