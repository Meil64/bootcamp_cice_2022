import Foundation

// Input Protocol
protocol AppleGenericDetailProviderInputProtocol {    
    func fetchData(completionHandler: @escaping (Result<AppServerModel, NetworkError>) -> Void)
}

final class AppleGenericDetailProvider : AppleGenericDetailProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<AppServerModel, NetworkError>) -> Void){
        self.networkService.requestGeneric(requestPayload: AppleGenericDetailRequestDTO.requestData(numeroItems: "10"),
                                           entityClass: AppServerModel.self) { [weak self] (result) in
            guard self != nil else {return}
            guard let resultUnw = result else {return}
            completionHandler(.success(resultUnw))
        } failure: { (error) in
            completionHandler(.failure(error))
        }

    }
    
}

struct AppleGenericDetailRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.apps, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
    
}
