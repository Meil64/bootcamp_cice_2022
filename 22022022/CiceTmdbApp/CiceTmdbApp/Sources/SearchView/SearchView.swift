import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        VStack {
            Text("Hello SearchView")
        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
