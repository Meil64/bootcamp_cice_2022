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
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataDetailMovieInteractor()
    }
    
}

// Output del Interactor
extension DetailMovieViewModel: DetailMovieInteractorOutputProtocol {
    func setInformationDetailMovie(data: DetailMovieServerModel?){
        guard let dataUnw = data else {
            return
        }
        self.data = dataUnw        
    }
}
