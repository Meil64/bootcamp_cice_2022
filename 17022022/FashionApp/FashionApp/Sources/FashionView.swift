//
//  FashionView.swift
//  FashionApp
//
//  Created by Carlos Carrera on 1/4/22.
//

import SwiftUI

struct FashionView: View {
    
    @State private var showCustomAlertView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    CustomNavigationView(showAlertTres: self.$showCustomAlertView)
                    CustomBodyMainView()
                }
                .blur(radius: showCustomAlertView ? 3 : 0)
                .animation(.easeInOut, value: self.showCustomAlertView)
                
                if showCustomAlertView {
                    CustomAlertView(title: "Esta es una Custom Alert View",
                                    message: "Esta es una alerta personalizada. Se colocará encima de la vista principal y se añadirá un efecto de blur con el fondo medio opaco",
                                    hideCustomAlertView: self.$showCustomAlertView)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct FashionView_Previews: PreviewProvider {
    static var previews: some View {
        FashionView()
    }
}
