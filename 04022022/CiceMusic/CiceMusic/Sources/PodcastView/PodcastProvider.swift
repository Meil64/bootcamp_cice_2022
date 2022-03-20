import Foundation

// Input Protocol
protocol PodcastProviderInputProtocol {    
    func fetchPodcastFromWebServiceProvider(completionHandler: @escaping (Result<PodcastServerModel, NetworkError>) -> Void)
}

final class PodcastProvider : PodcastProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchPodcastFromWebServiceProvider(completionHandler: @escaping (Result<PodcastServerModel, NetworkError>) -> Void){
        self.networkService.requestGeneric(requestPayload: PodcastRequestDTO.requestData(numeroItems: "20"),
                                           entityClass: PodcastServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completionHandler(.success(resultUnw))
        } failure: { (error) in
            completionHandler(.failure(error))
        }

    }
    
}

struct PodcastRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [NSLocale.current.languageCode ?? "us", numeroItems]
        let urlComplete = String(format: URLEnpoint.podcast, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
    
}
