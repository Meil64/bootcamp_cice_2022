import SwiftUI

struct DetailMovieView: View {
    
    @StateObject var viewModel = DetailMovieViewModel()
    @SwiftUI.Environment(\.presentationMode) var presenterMode
    @State private var selectedTrailer: VideoApiResult?
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                bodyView
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
    
    var headerView: some View {
        ZStack(alignment: .topLeading) {
            if let posterUrlUnw = self.viewModel.data?.posterUrl {
                MovieDetailImage(imageUrl: posterUrlUnw, imageLoaderVM: ImageLoader())
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
                    self.viewModel.saveDataAsFavorites()
                } label: {
                    Image(systemName: self.viewModel.isSaved ? "bookmark.fill" : "bookmark")
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
                Text(self.viewModel.data?.genreText ?? "")
                Text("·").fontWeight(.heavy)
                Text(self.viewModel.data?.yearText ?? "")
                Text(self.viewModel.data?.durationText ?? "")
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
        }
        .padding()
        .padding(.bottom, 100)
        .background(
            roundedShape()
                .fill(Color.black)
                .shadow(color: Color.black.opacity(0.3),
                        radius: 10, x: 0, y: -50)
        )
        .padding(.top, -60)
    }

}

struct MovieDetailImage: View {
    
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

struct roundedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView()
    }
}
