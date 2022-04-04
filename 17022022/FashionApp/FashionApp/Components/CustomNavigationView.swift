//
//  CustomNavigationView.swift
//  FashionApp
//
//  Created by Carlos Carrera on 1/4/22.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @State private var showAlert = false
    @State private var showAlertDos = false
    @Binding var showAlertTres: Bool
    
    var body: some View {
        ZStack{
            Text("Seasons").font(.system(size: 20))
            
            HStack(spacing: 8){
                
                //Alerta con Xcode 12
                
                Button{
                    self.showAlert.toggle()
                } label: {
                    Image(systemName: "slider.horizontal.3")
                }
                .alert(isPresented: self.$showAlert) {
                    Alert(title: Text("Hola soy una alerta en SwiftUI"),
                          message: Text("Aquí estamos aprendiendo a hacer alertas en SwiftUI"),
                          primaryButton: .default(Text("OK"),
                                                  action: {
                        //Acción primary button
                    }),
                          secondaryButton: .cancel(Text("Cancel"),
                                                   action: {
                        //Acción secondary button
                    }))
                }
                
                Spacer()
                
                //Alerta con XCode 13
                Button{
                    self.showAlertDos.toggle()
                } label: {
                    Image(systemName: "magnifyingglass")
                }
                .alert("Esta es una segunda Alerta en XCode13",
                       isPresented: self.$showAlertDos) {
                    Button("OK") {
                        
                    }
                    Button(role: .cancel){
                        
                    }label: {
                        Text("Cancel")
                    }
                }
                
                Button{
                    self.showAlertTres.toggle()
                } label: {
                    Image(systemName: "alarm")
                }
            }
            .padding(.horizontal, 8)
            .font(.callout)
            .foregroundColor(.black)
        }
        .background(Color.white)
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(showAlertTres: .constant(false))
    }
}
