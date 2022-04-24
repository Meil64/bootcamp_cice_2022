import Foundation
import SwiftUI


final class PeoplePopularCoordinator: BaseCoordinator {

    typealias ContentView = PeoplePopularView
    typealias ViewModel = PeoplePopularViewModel
    typealias Interactor = PeoplePopularInteractor
    typealias Provider = PeoplePopularProvider
    
    static func navigation() -> NavigationView<ContentView> {
        NavigationView {
            self.view()
        }
    }
    
    static func view(dto: PeoplePopularCoordinatorDTO? = nil) -> ContentView{
        let vip = BaseCoordinator.coordinator(viewModel: ViewModel.self,
                                              interactor: Interactor.self,
                                              provider: Provider.self)
        let view = ContentView(viewModel: vip.viewModel)
        return view
    }
    
}

struct PeoplePopularCoordinatorDTO {
    
}
