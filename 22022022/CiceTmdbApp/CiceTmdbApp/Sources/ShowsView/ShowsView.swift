import SwiftUI

struct ShowsView: View {
    
    @StateObject var viewModel = ShowsViewModel()
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.dataSourceAiringToday.isEmpty {
                    MoviesPosterCarousel(title: "Airing today",
                                         moviesModel: self.viewModel.dataSourceAiringToday,
                                         isPoster: false)
                }
            }
            Group{
                if !self.viewModel.dataSourceOnTheAir.isEmpty {
                    MoviesPosterCarousel(title: "On the air",
                                         moviesModel: self.viewModel.dataSourceOnTheAir,
                                         isPoster: true)
                }
            }
            Group{
                if !self.viewModel.dataSourcePopular.isEmpty {
                    MoviesPosterCarousel(title: "Popular",
                                         moviesModel: self.viewModel.dataSourcePopular,
                                         isPoster: false)
                }
            }
            Group{
                if !self.viewModel.dataSourceTopRated.isEmpty {
                    MoviesPosterCarousel(title: "Top rated",
                                         moviesModel: self.viewModel.dataSourceTopRated,
                                         isPoster: true)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("TV Shows"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct ShowsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}
