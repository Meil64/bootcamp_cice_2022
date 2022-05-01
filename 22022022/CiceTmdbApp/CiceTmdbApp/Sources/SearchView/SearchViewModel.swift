import Foundation
import Combine


// Output del Interactor
protocol SearchInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoSearchMoviesViewModel(data: [MoviesTVModel]?)
}

final class SearchViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: SearchInteractorInputProtocol?{
        super.baseInteractor as? SearchInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var query = ""
    @Published var dataSourceSearchMovie: [MoviesTVModel]? = []
    private var subscription: AnyCancellable?
    
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        guard subscription == nil else { return }
        self.subscription = self.$query.map { [weak self] text in
            self?.dataSourceSearchMovie = nil
            if text.count > 4 {
                return text
            }
            return ""
        }
        .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
        .sink(receiveValue: { [weak self] in
            self?.searchWith(text: $0)
        })
    }
    
    func searchWith(text: String) {
        self.dataSourceSearchMovie?.removeAll()
        guard !query.isEmpty else { return }
        self.interactor?.fetchDataSearchMovieInteractor(query: text)
    }
    
}

// Output del Interactor
extension SearchViewModel: SearchInteractorOutputProtocol {
    func setInfoSearchMoviesViewModel(data: [MoviesTVModel]?) {
        self.dataSourceSearchMovie = data ?? []
    }
}
