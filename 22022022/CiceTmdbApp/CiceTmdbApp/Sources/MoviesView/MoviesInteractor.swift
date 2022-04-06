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
}

//Output del Provider
protocol MoviesProviderOutputProtocol: BaseProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ApiResult]?, NetworkError>)
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
    
}

//Input Interactor
extension MoviesInteractor: MoviesInteractorInputProtocol {
    func fetchDataNowPlayingInteractor(){
        self.provider?.fetchDataNowPlayingProvider()
    }
}

//Output del Provider
extension MoviesInteractor: MoviesProviderOutputProtocol {
    func setInformationNowPlaying(completion: Result<[ApiResult]?, NetworkError>){
        switch completion {
        case .success(let data):
            self.viewModel?.setInfoNowPlayingViewModel(data: data)
        case .failure(let error):
            debugPrint(error)
        }
    }
}
