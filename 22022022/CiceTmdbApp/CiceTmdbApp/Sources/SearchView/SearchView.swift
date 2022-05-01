import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            SearchBarView(placeholder: "Search movie", text: self.$viewModel.query)
            
            if self.viewModel.dataSourceSearchMovie != nil && !(self.viewModel.dataSourceSearchMovie?.isEmpty ?? false) {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
                    ForEach(self.viewModel.dataSourceSearchMovie!) { movie in
                        NavigationLink {
                            DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(dataID: movie.id ?? 0))
                        } label: {
                            MoviePosterCell(model: movie, isPoster: true)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            } else {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 20)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.red, lineWidth: 2)
                    )
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
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
