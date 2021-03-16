//
//  EventService.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import Foundation


public final class EventService: NSObject {
    
    private let api = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    private let postApi = "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin"

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
    
    func postCheckin(id: String, name: String, email: String, completion: @escaping (Bool) -> () ) {
        
        let json: [String: Any] = ["eventId": id,
                                   "name": name,
                                   "email": email]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        let url = URL(string: postApi)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data else {
                completion(false)
                return
            }

            if error != nil {
                print(error?.localizedDescription ?? "No data")
                completion(false)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200..<300).contains(response.statusCode) else {
                print("Server error!")
                completion(false)
                return
            }
            
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if (responseJSON as? [String: Any]) != nil {
                completion(true)
            }
            
        }.resume()
        
    }

    
}
