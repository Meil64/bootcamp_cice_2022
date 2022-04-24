//
//  PeopleCarousel.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 24/4/22.
//

import SwiftUI

struct PeopleCarousel: View {
    
    let title: String
    let dataModel: [PeopleModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                Rectangle()
                    .fill(Color.red.opacity(0.3))
                    .frame(width: 50, height: 5)
            }
            .padding(.bottom, 10)
            
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
                ForEach(self.dataModel) { item in
                    NavigationLink {
                        DetailPersonView(dataModel: item.knownFor ?? [])
                    } label: {
                        PeopleCell(model: item)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct PeopleCell: View {
    
    let model: PeopleModel
    @ObservedObject var imageLoaderVM = ImageLoader()
    
    init(model: PeopleModel){
        self.model = model
        self.imageLoaderVM.loadImage(whit: self.model.profilePathUrl)
    }
    
    var body: some View {
        ZStack {
            if self.imageLoaderVM.image != nil {
                VStack {
                    Image(uiImage: self.imageLoaderVM.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
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

/*
struct PeopleCarousel_Previews: PreviewProvider {
    static var previews: some View {
        PeopleCarousel()
    }
}
 */
