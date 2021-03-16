//
//  EventsViewModel.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI

public class EventsViewModel: ObservableObject {
    
    @Published var events : [Events] = []
    @Published var show = false
    @Published var selected : String = ""
    
    public let eventService: EventService
    
    public init (eventService: EventService){
        self.eventService = eventService
    }
    
    public func getAll(){
        
        eventService.getAllEvents(completion: { events in
            
            DispatchQueue.main.async {
                self.events = events
            }
        })

    }
    
}
