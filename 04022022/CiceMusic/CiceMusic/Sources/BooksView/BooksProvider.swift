import Foundation

// Input Protocol
protocol BooksProviderInputProtocol {    
    func fetchBookFromWebServiceProvider(completionHandler: @escaping (Result<BookServerModel, NetworkError>) -> Void)
}

final class BooksProvider : BooksProviderInputProtocol{
    
    let networkService: NetworkServiceProtocol = NetworkService()
    
    func fetchBookFromWebServiceProvider(completionHandler: @escaping (Result<BookServerModel, NetworkError>) -> Void){
        self.networkService.requestGeneric(requestPayload: BooksRequestDTO.requestData(numeroItems: "20"),
                                           entityClass: BookServerModel.self) { [weak self] (result) in
            guard self != nil else { return }
            guard let resultUnw = result else { return }
            completionHandler(.success(resultUnw))
        } failure: { (error) in
            completionHandler(.failure(error))
        }

    }
    
}

struct BooksRequestDTO {
    
    static func requestData(numeroItems: String) -> RequestDTO {
        let argument: [CVarArg] = [numeroItems]
        let urlComplete = String(format: URLEnpoint.books, arguments: argument)
        let request = RequestDTO(params: nil, method: .get, endpoint: urlComplete, urlContext: .webService)
        return request
    }
    
}
