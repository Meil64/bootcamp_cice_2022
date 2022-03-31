//
//  HeaderComponent.swift
//  FashionApp
//
//  Created by Carlos Carrera on 30/3/22.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack{
            titleView(title: "Header Component")
            subtitleView(subtitle: "Estamos aprendiendo SwiftUI con Xcode 12 y 13 para mejorar nuestra compresión del mundo Apple.")
            descriptionView(description: "Estamos con la base de la gestión de subcomponentes que hace que SwiftUI sea súper ligero de entender")
        }
    }
}

struct titleView: View {
    var title: String    
    var body: some View{
        Text(title)
            .padding(20)
            .font(.title)
            .background(Color.orange)
            .foregroundColor(.black)
            .cornerRadius(20)
    }
}

struct subtitleView: View {
    var subtitle: String
    var body: some View{
        Text(subtitle)
            .font(.title3)
            .foregroundColor(.black)
            .padding(.horizontal, 20)
    }
}

struct descriptionView: View {
    var description: String
    var body: some View{
        Text(description)
            .background(Color.orange)
            .font(.callout)
            .foregroundColor(.black)
            .padding([.horizontal, .top], 20)         
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
    }
}
