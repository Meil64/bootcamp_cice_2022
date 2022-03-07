import Foundation

// Input Protocol
protocol MusicProviderInputProtocol {    
    
}

final class MusicProvider : MusicProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
}

struct MusicRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
    
}
