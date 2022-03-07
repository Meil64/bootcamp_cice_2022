import Foundation

// Input Protocol
protocol PodcastProviderInputProtocol {    
    
}

final class PodcastProvider : PodcastProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
}

struct PodcastRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
    
}
