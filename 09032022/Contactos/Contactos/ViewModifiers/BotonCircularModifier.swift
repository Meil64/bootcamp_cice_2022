//
//  BotonCircularModifier.swift
//  Contactos
//
//  Created by Carlos Carrera on 15/5/22.
//

import SwiftUI

struct BotonCircularModifier: ViewModifier {
    
    var fontFamily: String?
    var fontSize: CGFloat?
    var foregroundColor: Color?
    var backgroundColor: Color?
    var padding: CGFloat?
    
    func body(content: Content) -> some View {
        content
            .padding(padding ?? 20)
            .background(backgroundColor ?? Color.gray)
            .clipShape(Circle())
            .foregroundColor(foregroundColor ?? .white)
            .font(.custom(fontFamily ?? "Arial", size: fontSize ?? 20))
    }
}

struct BotonCircularModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("CC")
            .modifier(BotonCircularModifier())
    }
}

extension View {
    func circularButton(fontFamily: String? = nil,
                        fontSize: CGFloat? = nil,
                        foregroundColor: Color? = nil,
                        backgroundColor: Color? = nil,
                        padding: CGFloat? = nil) -> some View {
        self.modifier(BotonCircularModifier(fontFamily: fontFamily,
                                            fontSize: fontSize,
                                            foregroundColor: foregroundColor,
                                            backgroundColor: backgroundColor,
                                            padding: padding))
    }
}
