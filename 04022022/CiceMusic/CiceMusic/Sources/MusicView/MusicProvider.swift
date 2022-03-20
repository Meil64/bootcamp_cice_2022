import Foundation

// Input Protocol
protocol MusicProviderInputProtocol {    
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> Void)
}

final class MusicProvider : MusicProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchData(completionHandler: @escaping (Result<MusicServerModel, NetworkError>) -> Void) {
        self.networkService.requestGeneric(requestPayload: MusicRequestDTO.requestData(numeroItems: "99"),
                                           entityClass: MusicServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completionHandler(.success(resultUnw))
        } failure: { (error) in
            completionHandler(.failure(error))
        }
    }
    
}

struct MusicRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [NSLocale.current.languageCode ?? "us", numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
    
}
