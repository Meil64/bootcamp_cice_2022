//
//  MoviesPosterCarousel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 7/4/22.
//

import SwiftUI

struct MoviesPosterCarousel: View {
    
    var title: String
    var moviesModel: [MoviesTVModelView]
    var isPoster: Bool
    var isMovie: Bool
    var isShow: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack{
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.cyan.opacity(0.3))
                    .frame(width: 50, height: 5)
            }
            .padding(.bottom, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(self.moviesModel){movie in
                        NavigationLink {
                            if isMovie {
                                DetailMovieCoordinator.view(dto: DetailMovieCoordinatorDTO(dataID: movie.id ?? 0))
                            } else if isShow {
                                DetailShowCoordinator.view(dto: DetailShowCoordinatorDTO(dataID: movie.id ?? 0))
                            }
                        } label: {
                            MoviePosterCell(model: movie, isPoster: self.isPoster)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

struct MoviePosterCell: View {
    
    //En el padre @StateObject, en los hijos @ObservedObject
    @ObservedObject var imageLoaderVM = ImageLoader()
    private var modelData: MoviesTVModelView
    var isPoster: Bool
    
    init(model: MoviesTVModelView, isPoster: Bool? = true) {
        self.modelData = model
        self.isPoster = isPoster ?? false
        
        if isPoster ?? false {
            self.imageLoaderVM.loadImage(whit: modelData.posterUrl)
        } else {
            self.imageLoaderVM.loadImage(whit: modelData.backdropUrl)
        }
    }
    
    var body: some View {
        VStack {
            ZStack{
                if self.imageLoaderVM.image != nil {
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.red, lineWidth: 1)
                        )
                } else {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                             startPoint: .bottom,
                                             endPoint: .top))
                        .cornerRadius(8)
                }
            }
            .frame(width: self.isPoster ? 240 : 270, height: self.isPoster ? 306 : 150)
            
            if !self.isPoster {
                Text(self.modelData.title ?? "")
                    .fontWeight(.semibold)
                    .padding(.top, 15)
                    .lineLimit(1)
            }
        }
    }
}

/*
struct MoviesPosterCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MoviesPosterCarousel(title: "Now Playing",
                             moviesModel: MoviesServerModel.stubbedMoviesNowPlaying,
                             isPoster: true)
    }
}
 */
