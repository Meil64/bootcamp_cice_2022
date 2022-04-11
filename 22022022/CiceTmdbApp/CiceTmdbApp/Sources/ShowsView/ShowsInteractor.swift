import Foundation

//Input del Interactor
protocol ShowsInteractorInputProtocol: BaseInteractorInputProtocol {
    func fetchDataAiringTodayInteractor()
    func fetchDataOnTheAirInteractor()
    func fetchDataPopularInteractor()
    func fetchDataTopRatedInteractor()
}

//Output del Provider
protocol ShowsProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationAiringToday(completion: Result<[TVShowApiResult]?, NetworkError>)
    func setInformationPopular(completion: Result<[TVShowApiResult]?, NetworkError>)
    func setInformationTopRated(completion: Result<[TVShowApiResult]?, NetworkError>)
    func setInformationOnTheAir(completion: Result<[TVShowApiResult]?, NetworkError>)
}

final class ShowsInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: ShowsInteractorOutputProtocol? {
        super.baseViewModel as? ShowsInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: ShowsProviderInputProtocol? {
        super.baseProvider as? ShowsProviderInputProtocol
    }
    
    //Métodos
    func getMoviesTVModelViewFromData(data: [TVShowApiResult]?) -> [MoviesTVModelView]? {
        var datasourceMoviesTV: [MoviesTVModelView] = []
        if let dataUnw = data {
            for i in 0..<dataUnw.count {
                let object = MoviesTVModelView(id: dataUnw[i].id,
                                               backdropPath: dataUnw[i].backdropPath,
                                               posterPath: dataUnw[i].posterPath,
                                               title: dataUnw[i].name)
                datasourceMoviesTV.append(object)
            }
        }
        return datasourceMoviesTV
    }
    
}

//Input del Interactor
extension ShowsInteractor: ShowsInteractorInputProtocol {
    
    func fetchDataAiringTodayInteractor(){
        self.provider?.fetchDataAiringTodayProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
    func fetchDataTopRatedInteractor() {
        self.provider?.fetchDataTopRatedProvider()
    }
    
    func fetchDataOnTheAirInteractor() {
        self.provider?.fetchDataOnTheAirProvider()
    }
    
}

//Output del Provider
extension ShowsInteractor: ShowsProviderOutputProtocol {
    
    func setInformationAiringToday(completion: Result<[TVShowApiResult]?, NetworkError>){
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoAiringTodayViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationPopular(completion: Result<[TVShowApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationTopRated(completion: Result<[TVShowApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoTopRatedViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationOnTheAir(completion: Result<[TVShowApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoOnTheAirViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
}
