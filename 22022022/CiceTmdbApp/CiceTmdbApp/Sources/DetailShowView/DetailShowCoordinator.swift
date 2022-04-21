import Foundation
import SwiftUI


final class DetailShowCoordinator: BaseCoordinator {

    typealias ContentView = DetailShowView
    typealias ViewModel = DetailShowViewModel
    typealias Interactor = DetailShowInteractor
    typealias Provider = DetailShowProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: DetailShowCoordinatorDTO? = nil) -> ContentView{
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}

struct DetailShowCoordinatorDTO {
    
}
