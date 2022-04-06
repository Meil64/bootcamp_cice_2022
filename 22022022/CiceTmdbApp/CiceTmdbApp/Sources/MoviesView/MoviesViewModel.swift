//
//  MoviesViewModel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 6/4/22.
//

import Foundation

//Output del Interactor
protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ApiResult]?)
}

final class MoviesViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - DI
    var interactor: MoviesInteractorInputProtocol?{
        super.baseInteractor as? MoviesInteractorInputProtocol
    }
    
    //MARK: - Variables
    @Published var dataSourceNowPlaying: [ApiResult] = []
    
    //MARK: - Métodos públicos para View
    func fetchData() {
        self.interactor?.fetchDataNowPlayingInteractor()
    }

}

//Output del Interactor
extension MoviesViewModel: MoviesInteractorOutputProtocol {
    func setInfoNowPlayingViewModel(data: [ApiResult]?) {
        self.dataSourceNowPlaying.removeAll()
        self.dataSourceNowPlaying = data ?? []
    }
}
