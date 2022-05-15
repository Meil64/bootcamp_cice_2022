import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel = FavoritesViewModel()
    
    var body: some View {
        List{
            if !self.viewModel.dataSourceFavoriteMovies.isEmpty {
                MoviesPosterCarousel(title: "Movies",
                                     moviesModel: self.viewModel.dataSourceFavoriteMovies,
                                     isPoster: false,
                                     isMovie: true,
                                     isShow: false)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Favorites"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
