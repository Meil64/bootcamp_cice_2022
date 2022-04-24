//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 6/4/22.
//

import Foundation

//Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModel]?)
    func setInfoPopularViewModel(data: [MoviesTVModel]?)
    func setInfoTopRatedViewModel(data: [MoviesTVModel]?)
    func setInfoUpcomingViewModel(data: [MoviesTVModel]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModel] = []
    @Published var dataSourcePopular: [MoviesTVModel] = []
    @Published var dataSourceTopRated: [MoviesTVModel] = []
    @Published var dataSourceUpcoming: [MoviesTVModel] = []
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
        self.interactor?.fetchDataPopularInteractor()
        self.interactor?.fetchDataTopRatedInteractor()
        self.interactor?.fetchDataUpcomingInteractor()
    }

}

//Output del Interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    
    func setInfoNowPlayingViewModel(data: [MoviesTVModel]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
    func setInfoPopularViewModel(data: [MoviesTVModel]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [MoviesTVModel]?) {
        self.dataSourceTopRated.removeAll()
        self.dataSourceTopRated = data ?? []
    }
    
    func setInfoUpcomingViewModel(data: [MoviesTVModel]?) {
        self.dataSourceUpcoming.removeAll()
        self.dataSourceUpcoming = data ?? []
    }
    
}
