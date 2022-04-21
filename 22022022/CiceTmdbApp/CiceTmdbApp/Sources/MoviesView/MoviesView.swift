//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 6/4/22.
//

import SwiftUI

struct MoviesView: View {
    
    //En el padre @StateObject, en los hijos @ObservedObject
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List{
            Group{
                if !self.viewModel.dataSourceNowPlaying.isEmpty {
                    MoviesPosterCarousel(title: "Now Playing",
                                         moviesModel: self.viewModel.dataSourceNowPlaying,
                                         isPoster: false,
                                         isMovie: true,
                                         isShow: false)
                }
            }
            Group{
                if !self.viewModel.dataSourcePopular.isEmpty {
                    MoviesPosterCarousel(title: "Popular",
                                         moviesModel: self.viewModel.dataSourcePopular,
                                         isPoster: true,
                                         isMovie: true,
                                         isShow: false)
                }
            }
            Group{
                if !self.viewModel.dataSourceTopRated.isEmpty {
                    MoviesPosterCarousel(title: "Top Rated",
                                         moviesModel: self.viewModel.dataSourceTopRated,
                                         isPoster: false,
                                         isMovie: true,
                                         isShow: false)
                }
            }
            Group{
                if !self.viewModel.dataSourceUpcoming.isEmpty {
                    MoviesPosterCarousel(title: "Upcoming",
                                         moviesModel: self.viewModel.dataSourceUpcoming,
                                         isPoster: true,
                                         isMovie: true,
                                         isShow: false)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle(Text("Movies"))
        .onAppear {
            self.viewModel.fetchData()
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
