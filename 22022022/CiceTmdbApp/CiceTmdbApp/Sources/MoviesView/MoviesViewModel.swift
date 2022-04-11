//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 6/4/22.
//

import Foundation

//Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?)
    func setInfoPopularViewModel(data: [MoviesTVModelView]?)
    func setInfoTopRatedViewModel(data: [MoviesTVModelView]?)
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [MoviesTVModelView] = []
    @Published var dataSourcePopular: [MoviesTVModelView] = []
    @Published var dataSourceTopRated: [MoviesTVModelView] = []
    @Published var dataSourceUpcoming: [MoviesTVModelView] = []
    
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
    
    func setInfoNowPlayingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
    func setInfoPopularViewModel(data: [MoviesTVModelView]?) {
        self.dataSourcePopular.removeAll()
        self.dataSourcePopular = data ?? []
    }
    
    func setInfoTopRatedViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceTopRated.removeAll()
        self.dataSourceTopRated = data ?? []
    }
    
    func setInfoUpcomingViewModel(data: [MoviesTVModelView]?) {
        self.dataSourceUpcoming.removeAll()
        self.dataSourceUpcoming = data ?? []
    }
    
}
