//
//  Splash.swift
//  Sicredi
//
//  Created by Renato Ferraz on 16/03/21.
//

import SwiftUI

struct Splash: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack{
            Home()
            
            ZStack{
                Color("back")
                
                
                Image("logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 150, height: animate ? nil : 150)
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
            
        }
        
    }
    
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            withAnimation(Animation.easeOut(duration: 0.55)) {
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.45)) {
                endSplash.toggle()
            }
            
        }
    }
    
    
}

struct Home: View {
    
    var body: some View{
        
        ZStack{
            
            let nome  : String = UserDefaults.standard[.nome]
            let email : String = UserDefaults.standard[.email]
            
            if nome == "" && email == "" {
                
                //tela de login
                UserView()
                
            }else{
                let eventsService = EventService()
                let vm = EventsViewModel(eventService: eventsService)
                EventsView(eventsVM: vm)
            }
        }
    }
}
