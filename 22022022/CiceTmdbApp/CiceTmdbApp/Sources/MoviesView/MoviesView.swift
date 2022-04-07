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
                    MoviesPosterCarousel(title: "Now Playting",
                                         moviesModel: self.viewModel.dataSourceNowPlaying,
                                         isPoster: true)
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
