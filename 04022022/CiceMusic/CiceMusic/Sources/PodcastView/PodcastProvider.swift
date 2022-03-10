import Foundation

// Input Protocol
protocol PodcastProviderInputProtocol {    
    func fetchPodcastFromWebServiceProvider()
}

final class PodcastProvider : PodcastProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchPodcastFromWebServiceProvider(){
        
    }
    
}

struct PodcastRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.podcast, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
    
}
