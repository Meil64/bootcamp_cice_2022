//
//  MoviesInteractor.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 6/4/22.
//

import Foundation

//Input Interactor
protocol MoviesInteractorInputProtocol: BaseInteractorInputProtocol{
    func fetchDataNowPlayingInteractor()
    func fetchDataPopularInteractor()
    func fetchDataTopRatedInteractor()
    func fetchDataUpcomingInteractor()
}

//Output del Provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[MovieApiResult]?, NetworkError>)
    func setInformationPopular(completion: Result<[MovieApiResult]?, NetworkError>)
    func setInformationTopRated(completion: Result<[MovieApiResult]?, NetworkError>)
    func setInformationUpcoming(completion: Result<[MovieApiResult]?, NetworkError>)
}

final class MoviesInteractor: BaseInteractor {
    
    //MARK: - DI
    weak var viewModel: MoviesInteractorOutputProtocol? {
        super.baseViewModel as? MoviesInteractorOutputProtocol
    }
    
    //MARK: - DI
    var provider: MoviesProviderInputProtocol? {
        super.baseProvider as? MoviesProviderInputProtocol
    }
    
    //Métodos
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

//Input Interactor
extension MoviesInteractor: MoviesInteractorInputProtocol {
    
    func fetchDataNowPlayingInteractor(){
        self.provider?.fetchDataNowPlayingProvider()
    }
    
    func fetchDataPopularInteractor() {
        self.provider?.fetchDataPopularProvider()
    }
    
    func fetchDataTopRatedInteractor() {
        self.provider?.fetchDataTopRatedProvider()
    }
    
    func fetchDataUpcomingInteractor() {
        self.provider?.fetchDataUpcomingProvider()
    }
    
}

//Output del Provider
extension MoviesInteractor: MoviesProviderOutputProtocol {
    
    func setInformationNowPlaying(completion: Result<[MovieApiResult]?, NetworkError>){
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationPopular(completion: Result<[MovieApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoPopularViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationTopRated(completion: Result<[MovieApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoTopRatedViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
    func setInformationUpcoming(completion: Result<[MovieApiResult]?, NetworkError>) {
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoUpcomingViewModel(data: self.getMoviesTVModelViewFromData(data: data))
        case .failure(let error):
            debugPrint(error)
        }
    }
    
}
