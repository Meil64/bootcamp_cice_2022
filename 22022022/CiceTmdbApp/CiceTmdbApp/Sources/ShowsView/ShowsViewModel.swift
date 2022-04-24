import Foundation


// Output del Interactor
protocol ShowsInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoAiringTodayViewModel(data: [MoviesTVModel]?)
    func setInfoOnTheAirViewModel(data: [MoviesTVModel]?)
    func setInfoPopularViewModel(data: [MoviesTVModel]?)
    func setInfoTopRatedViewModel(data: [MoviesTVModel]?)
}

final class ShowsViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: ShowsInteractorInputProtocol?{
        super.baseInteractor as? ShowsInteractorInputProtocol
    }
    
    //MARK: - Variables @Published
    @Published var dataSourceAiringToday: [MoviesTVModel] = []
    @Published var dataSourceOnTheAir: [MoviesTVModel] = []
    @Published var dataSourcePopular: [MoviesTVModel] = []
    @Published var dataSourceTopRated: [MoviesTVModel] = []
    
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
    
    func setInfoAiringTodayViewModel(data: [MoviesTVModel]?) {
        self.dataSourceAiringToday.removeAll()
        self.dataSourceAiringToday = data ?? []
    }
    func setInfoOnTheAirViewModel(data: [MoviesTVModel]?) {
        self.dataSourceOnTheAir.removeAll()
        self.dataSourceOnTheAir = data ?? []
    }
    
    func setInfoPopularViewModel(data: [MoviesTVModel]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [MoviesTVModel]?) {
        self.dataSourceTopRated.removeAll()
        self.dataSourceTopRated = data ?? []
    }
    
}
