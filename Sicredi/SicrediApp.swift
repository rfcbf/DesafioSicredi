//
//  SicrediApp.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI
import Defaults

@main
struct SicrediApp: App {
    var body: some Scene {
        WindowGroup {
            
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
