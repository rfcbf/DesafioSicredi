//
//  SicrediApp.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI

@main
struct SicrediApp: App {
    var body: some Scene {
        WindowGroup {
            let eventsService = EventService()
            let vm = EventsViewModel(eventService: eventsService)
            EventsView(eventsVM: vm)
        }
    }
}
