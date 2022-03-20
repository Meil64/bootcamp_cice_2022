//
//  SplashProvider.swift
//  CiceMusic
//
//  Created by Carlos Carrera on 4/3/22.
//

import Foundation

protocol SplashProviderInputProtocol {
    func fetchData(completionHandler: @escaping (Result<MenuServerModel, NetworkError>) -> Void)
}

final class SplashProvider: SplashProviderInputProtocol {
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<MenuServerModel, NetworkError>) -> Void){
        self.networkService.requestGeneric(requestPayload: SplashRequestDTO.requestData(),
                                           entityClass: MenuServerModel.self) { [weak self] (result) in
            guard self != nil else {return}
            guard let resultUnw = result else {return}
            completionHandler(.success(resultUnw))
        } failure: { [weak self] (error) in
            guard self != nil else {return}
            completionHandler(.failure(error))
        }

    }
    
}

struct SplashRequestDTO {
    static func requestData() -> RequestDTO {
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEnpoint.menu, urlContext: .heroku)
        return request
    }
}
