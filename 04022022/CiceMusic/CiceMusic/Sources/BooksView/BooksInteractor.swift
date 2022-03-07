import Foundation

// Input del Interactor
protocol BooksInteractorInputProtocol {
    
}

final class BooksInteractor: BaseInteractor<BooksInteractorOutputProtocol> {
    
    let provider: BooksProviderInputProtocol = BooksProvider()
    
}

// Input del Interactor
extension BooksInteractor: BooksInteractorInputProtocol {
    
}
