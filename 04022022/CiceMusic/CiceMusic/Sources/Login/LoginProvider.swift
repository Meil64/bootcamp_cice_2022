import Foundation

// Input Protocol
protocol LoginProviderInputProtocol {    
    
}

final class LoginProvider : LoginProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
}

struct LoginRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.music, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .heroku)
        return request
    }
    
}
