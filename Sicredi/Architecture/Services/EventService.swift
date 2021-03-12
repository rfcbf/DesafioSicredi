//
//  EventService.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import Foundation


public final class EventService: NSObject {
    
    private let api = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    
    func getAllEvents(completion: @escaping ([Events]) -> ()) {
        
        guard let urlString = api.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            if let response = try? JSONDecoder().decode([Events].self, from: data){
                completion(response)
            }
        }.resume()
    }

    
}
