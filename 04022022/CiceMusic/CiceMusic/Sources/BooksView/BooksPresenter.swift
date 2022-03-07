import Foundation

// Input del Presenter
protocol BooksPresenterInputProtocol {
    
}

// Output del Interactor
protocol BooksInteractorOutputProtocol {
    
}

final class BooksPresenter: BasePresenter<BooksPresenterOutputProtocol, BooksInteractorInputProtocol, BooksRouterInputProtocol> {
    
    
    
}

// Input del Presenter
extension BooksPresenter: BooksPresenterInputProtocol {
    
}

// Output del Interactor
extension BooksPresenter: BooksInteractorOutputProtocol {
    
}
