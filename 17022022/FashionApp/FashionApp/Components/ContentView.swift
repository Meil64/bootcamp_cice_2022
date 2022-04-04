//
//  ContentView.swift
//  FashionApp
//
//  Created by Carlos Carrera on 30/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderComponent()
            Text("Hola mundo!")
                .font(.title)
            
            Button {
                
            } label: {
                HStack{
                    Image(systemName: "play")
                    Text("Play")
                }
            }
            .padding()
            .font(.title2)
            .foregroundColor(.black)
            .background(Color.yellow)
            .cornerRadius(10)
            .shadow(radius: 10)
        }
    }
}

struct RefactoringView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                HeaderComponent()
                Image(systemName: "hand.thumbsup.fill")
                    .font(.system(size: 50))
                Image("captura1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.horizontal, .bottom], 20)
                    .shadow(color: Color.black.opacity(0.5),
                            radius: 20, x: 5, y: 5)
                    .overlay{
                        Text("Hola Chicos")
                            .foregroundColor(.red)
                            .font(.title)
                            .fontWeight(.heavy)
                    }
            }
        }
    }
}

struct ShapesView: View {
    var body: some View {
        VStack(spacing:20){
            HeaderComponent()
            Text("Se puede meter shapes para decorar las vistas")
                .foregroundColor(.orange)
                .padding(10)
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.black)
                )
                .padding(8)
            Text("Se puede ajustar el fondo pero No con un Shape")
                .foregroundColor(.orange)
                .padding(10)
                .background(Color.black)
                .cornerRadius(20)
                .padding(8)
                .shadow(radius: 10)
        }
    }
}

struct VerticalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                HeaderComponent()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un máximo de 10")
                    Divider()
                    Image(systemName: "arrow.left")
                }
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                )
                .padding()
                
                VStack(alignment: .trailing, spacing: 10) {
                    Text("VStack dentro de otra VStack")
                    Divider()
                    Text("Esta puede tener subvistas")
                    Divider()
                    Text("Hasta un máximo de 10")
                    Divider()
                    Image(systemName: "arrow.right")
                }
                .font(.title2)
                .padding()
                .foregroundColor(.white)
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.blue)
                )
                .padding()
            }
        }
    }
}

struct HorizontalStackView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack{
                HeaderComponent()
                HStack(spacing:20) {
                    Text("Leading")
                    Text("Middle")
                    Text("Trailing")
                }
                .padding()
                .border(Color.orange)
                
                HStack{
                    Image(systemName: "1.circle").foregroundColor(.yellow)
                    Image(systemName: "2.circle").foregroundColor(.blue)
                    Image(systemName: "3.circle").foregroundColor(.red)
                }
                .padding()
                .font(.largeTitle)
                
                HStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 100) {
                            Button(action: {}) {
                                Image(systemName: "a.circle.fill").foregroundColor(.red)
                            }
                            Image(systemName: "b.circle.fill").foregroundColor(.yellow)
                            Image(systemName: "c.circle.fill").foregroundColor(.black)
                            Image(systemName: "d.circle.fill").foregroundColor(.red)
                            Image(systemName: "e.circle.fill").foregroundColor(.blue)
                            Image(systemName: "f.circle.fill").foregroundColor(.cyan)
                        }
                        .padding()
                    }
                }
                .font(.largeTitle)
                .background(Color.clear)
            }
        }
    }
}

struct AlignmentHStackView: View {
    var body: some View {
        VStack(spacing:20) {
            HeaderComponent()
            
            HStack{
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading")
                Spacer()
                Text("Center")
                Spacer()
                Text("Trailing").padding(.trailing, 5)
            }
            .border(Color.orange)
            
            HStack(alignment: .top){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading").padding([.leading, .top], 5)
                Spacer()
                Text("Center").padding(.top, 5)
                Spacer()
                Text("Trailing").padding([.trailing, .top], 5)
            }
            .border(Color.orange)
            
            HStack(alignment: .bottom){
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width: 25)
                Text("Leading").padding([.leading, .bottom], 5)
                Spacer()
                Text("Center").padding(.bottom, 5)
                Spacer()
                Text("Trailing").padding([.trailing, .bottom], 5)
            }
            .border(Color.orange)
        }
    }
}

struct HStackPriorityView: View {
    
    var textViewAux: some View{
        Text(".layoutPriority(1) asigna hacia dónde va el equilibrio de la vista")
            .font(.largeTitle)
            .padding(.horizontal)
            .background(Color.orange)
    }
    
    var priorityHStack: some View {
        VStack{
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .lineLimit(2)
                Image("captura1")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
                    .layoutPriority(1)
            }
            .padding(.horizontal)
            
            HStack{
                Text("SwiftUI")
                    .font(.title)
                    .lineLimit(2)
                    .layoutPriority(1)
                Image("captura1")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("Equilibrio de la vista")
                    .font(.title2)
            }
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    func showNewText() -> some View {
        VStack(alignment: .center, spacing: 20){
            Text("Toma ya!")
        }
        
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HeaderComponent()
            textViewAux
            priorityHStack
            showNewText()
        }
    }
}

struct IntroZStackView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 20){
                Spacer()
                HeaderComponent()
                Spacer()
            }
            
            Text("Esta es una ZStack")
            Text("El contenido se apila en Z")
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray)
        //.edgesIgnoringSafeArea(.all)
    }
}

struct BasicChangesCircle: View {
    
    @State //Para poder cambiar el valor de una variable de una struct
    private var change = false
    
    var body: some View {
        VStack(spacing:20){
            Circle()
                .foregroundColor(.orange)
                .frame(width: 100, height: 100)
                .offset(x: self.change ? 120 : 0, y: self.change ? 300 : 0)
                .animation(.easeInOut(duration:2), value: self.change)
            
            Spacer()
            
            Button("Change"){
                self.change.toggle()
            }
        }
    }
}

struct CurvesAnimationsView: View {
    
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20){
            Text("Animación con curvas")
                .font(.largeTitle)
            
            Group{
                Text("1")
                GeometryReader{ proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.easeInOut(duration:2), value: self.move)
                }
                
                Text("2")
                GeometryReader{ proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.linear(duration:2), value: self.move)
                }
                
                Text("3")
                GeometryReader{ proxy in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                        .position(x: self.move ? (proxy.size.width - 40) : 40, y: 40)
                        .animation(.easeOut(duration:2), value: self.move)
                }
            }
            
            Button("Change"){
                self.move.toggle()
            }
            .font(.largeTitle)
            .padding(.bottom)
        }
    }
}

struct CurvesAnimationsViewDos: View {
    
    @State private var change = false
    @State private var x: CGFloat = 0
    @State private var y: CGFloat = 0
    private var xA: CGFloat = 0
    private var yA: CGFloat = 0
    private var xB: CGFloat = -250
    private var yB: CGFloat = -450
    
    var body: some View {
        VStack(spacing: 20){
            Text("Esto es otra prueba").font(.largeTitle)
            Text("Vamos a probar con más animaciones").font(.callout)
            Spacer()
            HStack{
                Spacer()
                Circle()
                    .foregroundColor(.orange)
                    .frame(width: 100, height: 100)
                    .offset(x: self.x, y: self.y)
                    .animation(.easeInOut, value: self.change)
            }
            
            Button("Change"){
                self.change.toggle()
                self.x = self.change ? self.xB : self.xA
                self.y = self.change ? self.yB : self.yA
            }
        }
    }
}

struct MenuAnimationView: View {
    
    @State private var showButtonMenu = false
    @State private var navButton1 = false
    @State private var navButton2 = false
    @State private var navButton3 = false
    
    var body: some View {
        NavigationView{
            
            ZStack(alignment: .bottomTrailing) {
                
                ScrollView{
                    VStack(spacing: 20){
                        Text("Menú Flotante").font(.title)
                        Text("Como les gusta a los Androides").font(.callout)
                        Spacer()
                        ShapesView()
                        CurvesAnimationsView()
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                
                Group {
                    boton1
                    boton2
                    boton3
                    botonMenu
                }
                .padding()
                .foregroundColor(.white)
                .animation(.default, value: self.showButtonMenu)
                
                Group {
                    NavigationLink(isActive: self.$navButton1) {
                        Text("Soy una vista texto 1")
                    } label: {
                        Text("")
                    }
                }
                Group {
                    NavigationLink(isActive: self.$navButton2) {
                        Text("Soy una vista texto 2")
                    } label: {
                        Text("")
                    }
                }
                Group {
                    NavigationLink(isActive: self.$navButton3) {
                        Text("Soy una vista texto 3")
                    } label: {
                        Text("")
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("Test Navegación")
        }
    }
    
    var boton1: some View{
        Button {
            self.navButton1.toggle()
            self.showButtonMenu.toggle()
        } label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        }
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color:Color.black.opacity(0.3), radius: 10, x:4, y:4)
        )
        .offset(x: 0, y: self.showButtonMenu ? -150 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var boton2: some View{
        Button {
            self.navButton2.toggle()
            self.showButtonMenu.toggle()
        } label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        }
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color:Color.black.opacity(0.3), radius: 10, x:4, y:4)
        )
        .offset(x: self.showButtonMenu ? -150 : 0, y: 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var boton3: some View{
        Button {
            self.navButton3.toggle()
            self.showButtonMenu.toggle()
        } label: {
            Image(systemName: "bag.badge.plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 0 : -90))
        }
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color:Color.black.opacity(0.3), radius: 10, x:4, y:4)
        )
        .offset(x: self.showButtonMenu ? -100 : 0, y: self.showButtonMenu ? -100 : 0)
        .opacity(self.showButtonMenu ? 1 : 0)
    }
    var botonMenu: some View{
        Button {
            self.showButtonMenu.toggle()
        } label: {
            Image(systemName: "plus")
                .padding(24)
                .rotationEffect(Angle.degrees(self.showButtonMenu ? 45 : 0))
        }
        .background(
            Circle()
                .fill(Color.green)
                .shadow(color:Color.black.opacity(0.3), radius: 10, x:4, y:4)
        )
        .offset(x: 0, y: 0)
        .opacity(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //IntroZStackView().previewDevice("iPhone X")
        //CurvesAnimationsViewDos().preferredColorScheme(.dark)
        MenuAnimationView()
    }
}
