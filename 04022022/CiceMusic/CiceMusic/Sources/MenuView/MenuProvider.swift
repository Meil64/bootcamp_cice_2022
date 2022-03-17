import Foundation

// Input Protocol
protocol MenuProviderInputProtocol {    
    
}

final class MenuProvider : MenuProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
}

struct MenuRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete)
        return request
    }
    
}
