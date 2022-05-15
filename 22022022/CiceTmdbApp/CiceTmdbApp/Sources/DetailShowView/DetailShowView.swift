import SwiftUI

struct DetailShowView: View {
    
    @StateObject var viewModel = DetailShowViewModel()
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
            if let posterUrlUnw = self.viewModel.data?.posterUrl {
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
                
                /* TODO como en Movies
                Button{
                    //Aqui salvaremos las series como favoritas en una BBDD (1.Firebase | 2.UserDefault)
                } label: {
                    Image(systemName: "bookmark")
                }
                .padding()
                .background(Color.white.opacity(0.7))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 40, leading: 20, bottom: 0, trailing: 0))
                */
            }
            .foregroundColor(Color.red)
        }
    }
    
    var bodyView: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack{
                Text(self.viewModel.data?.genreText ?? "")
                Text("·").fontWeight(.heavy)
                Text(self.viewModel.data?.yearText ?? "")
                //Text(self.viewModel.data?.durationText ?? "")
            }
            
            Text(self.viewModel.data?.overview ?? "")
                .font(.title2)
            
            HStack{
                if !(self.viewModel.data?.ratingText.isEmpty ?? false) {
                    Text(self.viewModel.data?.ratingText ?? "")
                        .foregroundColor(.red)
                }
                Text(self.viewModel.data?.scoreText ?? "")
                Spacer()
            }
            
            Text("Starring")
                .font(.title)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false){
                if self.viewModel.data?.cast != nil && !(self.viewModel.data?.cast?.isEmpty ?? false) {
                    CastCarouselView(model: self.viewModel.data?.cast ?? [])
                }
            }
            
            HStack(alignment: .top, spacing: 4) {
                if self.viewModel.data?.crew != nil && !(self.viewModel.data?.crew?.isEmpty ?? false) {
                    VStack(alignment: .leading, spacing: 4) {
                        if self.viewModel.data?.directors != nil && !(self.viewModel.data?.directors?.isEmpty ?? false) {
                            Text("Director[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.directors?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        
                        if self.viewModel.data?.producers != nil && !(self.viewModel.data?.producers?.isEmpty ?? false) {
                            Text("Producer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.producers?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                        
                        if self.viewModel.data?.screenWriters != nil && !(self.viewModel.data?.screenWriters?.isEmpty ?? false) {
                            Text("Writer[s]")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.top)
                            ForEach((self.viewModel.data?.screenWriters?.prefix(2))!) { item in
                                Text(item.name ?? "")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            if self.viewModel.data?.youtubeTrailers != nil && !(self.viewModel.data?.youtubeTrailers?.isEmpty ?? false){
                VStack(alignment: .leading, spacing: 20) {
                    Text("Trailers")
                        .font(.title)
                        .fontWeight(.bold)
                    ForEach((self.viewModel.data?.youtubeTrailers)!) { item in
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
            
            if !(self.viewModel.data?.seasonEpisodes ?? "").isEmpty {
                Text("Seasons")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                Text((self.viewModel.data?.seasonEpisodes ?? "") + " episodes.")
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
        .sheet(item: self.$selectedTrailer) { myTrailer in
            SafariView(url: myTrailer.youtubeURL!)
        }
        .onAppear {
            self.viewModel.fetchData()
        }
    }

}

struct ShowDetailImage: View {
    
    let imageUrl: URL
    @StateObject var imageLoaderVM: ImageLoader
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .cornerRadius(8)
                .shadow(radius: 10)
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 10)
            }
        }
        .onAppear {
            self.imageLoaderVM.loadImage(whit: imageUrl)
        }
    }
}

struct DetailShowView_Previews: PreviewProvider {
    static var previews: some View {
        DetailShowView()
    }
}
