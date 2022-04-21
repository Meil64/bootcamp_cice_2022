import Foundation
import SwiftUI


final class DetailMovieCoordinator: BaseCoordinator {

    typealias ContentView = DetailMovieView
    typealias ViewModel = DetailMovieViewModel
    typealias Interactor = DetailMovieInteractor
    typealias Provider = DetailMovieProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: DetailMovieCoordinatorDTO? = nil) -> ContentView{
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        vip.provider.dataDTO = dto
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}

struct DetailMovieCoordinatorDTO {
    var dataID: Int
}
