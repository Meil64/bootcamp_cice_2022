//
//  DetailShowTest.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 23/4/22.
//

import SwiftUI

struct DetailShowTest: View {
    
    var viewModel = DetailShowServerModel.stubbedDetailShow!
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    @State private var selectedTrailer: VideoApiResult?
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                bodyView
            }
        }
    }
    
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            if let posterUrlUnw = self.viewModel.posterUrl {
                ShowDetailImage(imageUrl: posterUrlUnw, imageLoaderVM: ImageLoader())
            }
            
            HStack{
                Button{
                    self.presenterMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                
                Spacer()
                
                Button{
                    //Aqui salvaremos las series como favoritas en una BBDD (1.Firebase | 2.UserDefault)
                } label: {
                    Image(systemName: "bookmark")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                            
            }
            .foregroundColor(Color.red)
        }
    }
    
    var bodyView: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack{
                Text(self.viewModel.genreText)
                Text("·").fontWeight(.heavy)
                Text(self.viewModel.yearText)
                //Text(self.viewModel.data?.durationText ?? "")
            }
            
            Text(self.viewModel.overview ?? "")
                .font(.title2)
            
            HStack{
                if !(self.viewModel.ratingText.isEmpty) {
                    Text(self.viewModel.ratingText)
                        .foregroundColor(.red)
                }
                Text(self.viewModel.scoreText)
                Spacer()
            }
            
            Text("Starring")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false){
                if self.viewModel.cast != nil && !(self.viewModel.cast?.isEmpty ?? false) {
                    CastCarouselView(model: self.viewModel.cast ?? [])
                }
            }
            
            HStack(alignment: .top, spacing: 4) {
                if self.viewModel.crew != nil && !(self.viewModel.crew?.isEmpty ?? false) {
                    VStack(alignment: .leading, spacing: 4) {
                        if self.viewModel.directors != nil && !(self.viewModel.directors?.isEmpty ?? false) {
                            Text("Director[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.directors?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        
                        if self.viewModel.producers != nil && !(self.viewModel.producers?.isEmpty ?? false) {
                            Text("Producer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.producers?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        
                        if self.viewModel.screenWriters != nil && !(self.viewModel.screenWriters?.isEmpty ?? false) {
                            Text("Writer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.screenWriters?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            if self.viewModel.youtubeTrailers != nil && !(self.viewModel.youtubeTrailers?.isEmpty ?? false){
                VStack(alignment: .leading, spacing: 20) {
                    Text("Trailers")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach((self.viewModel.youtubeTrailers)!) { item in
                        Button {
                            self.selectedTrailer = item
                        } label: {
                            HStack {
                                Text(item.name ?? "")
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(.red)
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            
            if !self.viewModel.seasonEpisodes.isEmpty {
                Text("Seasons")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Text(self.viewModel.seasonEpisodes + " episodes.")
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .sheet(item: self.$selectedTrailer) { myTrailer in
            SafariView(url: myTrailer.youtubeURL!)
        }
    }

}

struct DetailShowTest_Previews: PreviewProvider {
    static var previews: some View {
        DetailShowTest(viewModel: DetailShowServerModel.stubbedDetailShow!)
    }
}
