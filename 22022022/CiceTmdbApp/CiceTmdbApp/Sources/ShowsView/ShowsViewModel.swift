import Foundation


// Output del Interactor
protocol ShowsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoAiringTodayViewModel(data: [MoviesTVModelView]?)
    func setInfoOnTheAirViewModel(data: [MoviesTVModelView]?)
    func setInfoPopularViewModel(data: [MoviesTVModelView]?)
    func setInfoTopRatedViewModel(data: [MoviesTVModelView]?)
}

final class ShowsViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: ShowsInteractorInputProtocol?{
        super.baseInteractor as? ShowsInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var dataSourceAiringToday: [MoviesTVModelView] = []
    @Published var dataSourceOnTheAir: [MoviesTVModelView] = []
    @Published var dataSourcePopular: [MoviesTVModelView] = []
    @Published var dataSourceTopRated: [MoviesTVModelView] = []
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataAiringTodayInteractor()
        self.interactor?.fetchDataOnTheAirInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRatedInteractor()
    }
    
}

// Output del Interactor
extension ShowsViewModel: ShowsInteractorOutputProtocol {
    
    func setInfoAiringTodayViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceAiringToday.removeAll()
        self.dataSourceAiringToday = data ?? []
    }
    func setInfoOnTheAirViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceOnTheAir.removeAll()
        self.dataSourceOnTheAir = data ?? []
    }
    
    func setInfoPopularViewModel(data: [MoviesTVModelView]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceTopRated.removeAll()
        self.dataSourceTopRated = data ?? []
    }
    
}
