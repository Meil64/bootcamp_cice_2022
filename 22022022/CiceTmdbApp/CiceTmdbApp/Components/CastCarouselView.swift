//
//  MovieCastCarouselView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 21/4/22.
//

import SwiftUI

struct CastCarouselView: View {
    
    let model: [Cast]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 12) {
                    ForEach(self.model) { item in
                        CastCell(model: item)
                    }
                }
            }
        }
    }
}

struct CastCell: View {
    
    let model: Cast    
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: Cast){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.profilePathUrl)
    }
    
    var body: some View {
        HStack {
            if self.imageLoaderVM.image != nil {
                Image(uiImage: self.imageLoaderVM.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 5) {
                    Text(self.model.name ?? "")
                        .font(.headline)
                }
            } else {
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.clear]),
                                         startPoint: .bottom,
                                         endPoint: .top))
                    .clipShape(Circle())
            }
        }
    }
    
}


struct MovieCastCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CastCarouselView(model: [Cast(adult: false,
                                           gender: 1,
                                           id: 3156344,
                                           knownForDepartment: "Acting",
                                           name: "Rosalie Chiang",
                                           originalName: "Rosalie Chiang",
                                           popularity: 7.945,
                                           profilePath: "/cbEWkQM0FS9vzv07JFErCk0YKkx.jpg",
                                           castID: 6,
                                           character: "Meilin 'Mei' Lee (voice)",
                                           creditID: "60ed8ac0ab1bc7005e36338b",
                                           order: 0)])
    }
}
