//
//  Background.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import SwiftUI

struct Background: View {
    var body: some View {
        
        ZStack(){
            AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)), Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)), Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)), Color(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1))]), center: .topLeading, angle: .degrees(120))
            
            LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0), Color.white.opacity(1)]), startPoint: .bottom, endPoint: .top)
        }.ignoresSafeArea()
        
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
    }
}
