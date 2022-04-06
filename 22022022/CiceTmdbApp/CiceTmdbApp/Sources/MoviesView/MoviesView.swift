//
//  MoviesView.swift
//  CiceTmdbApp
//
//  Created by Carlos Carrera on 6/4/22.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        List(self.viewModel.dataSourceNowPlaying){ item in
            VStack{
                Text(item.originalTitle ?? "")
            }
        }
        .navigationTitle(Text("NowPlaying"))
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
