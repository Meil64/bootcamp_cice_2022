import Foundation


// Output del Interactor
protocol DetailMovieInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInformationDetailMovie(data: DetailMovieServerModel?)
}

final class DetailMovieViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: DetailMovieInteractorInputProtocol?{
        super.baseInteractor as? DetailMovieInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var data: DetailMovieServerModel?
    @Published var isSaved = false
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataDetailMovieInteractor()
    }
    
    func saveDataAsFavorites() {
        if(self.isSaved){
            self.interactor?.removeDataFromFavoritesInteractor()
        } else {
            self.interactor?.saveDataAsFavoritesInteractor()
        }
        self.isSaved.toggle()
    }
    
}

// Output del Interactor
extension DetailMovieViewModel: DetailMovieInteractorOutputProtocol {
    func setInformationDetailMovie(data: DetailMovieServerModel?){
        guard let dataUnw = data else {
            return
        }
        self.data = dataUnw
        DDBB.shared.getAllLocal { result in
            result?.downloads.map{ item in
                item.map{ itemX in
                    self.isSaved = "\(self.data?.id ?? 0)" == itemX.id
                }
            }
        } failure: { error in
            debugPrint(error)
        }

    }
}
