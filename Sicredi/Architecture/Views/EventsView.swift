//
//  ContentView.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI

struct EventsView: View {
    
    @ObservedObject var eventsVM : EventsViewModel
    
    @ViewBuilder
    var body: some View {
        
        NavigationView{
            List{
                
                ForEach(eventsVM.events) { event in
                    Text(event.title)
                }
                
            }
            .navigationBarTitle("Eventos")
        }
        .onAppear{
            eventsVM.getAll()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EventsView(eventsVM: EventsViewModel(eventService: EventService()))
    }
}
