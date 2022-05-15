import Foundation
import SwiftUI


final class FavoritesCoordinator: BaseCoordinator {

    typealias ContentView = FavoritesView
    typealias ViewModel = FavoritesViewModel
    typealias Interactor = FavoritesInteractor
    typealias Provider = FavoritesProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: FavoritesCoordinatorDTO? = nil) -> ContentView{
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}

struct FavoritesCoordinatorDTO {
    
}
