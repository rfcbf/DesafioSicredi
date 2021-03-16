//
//  Event.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI

struct Events: Codable, Identifiable {
    
    var id: String
    var date: Date?
    var description: String
    var image: URL?
    var latitude: Double
    var longitude: Double
    var people: [People]
    var price: Double
    var title: String
    
    enum CodingKeys : String, CodingKey {
        case date
        case description
        case id
        case image
        case latitude
        case longitude
        case people
        case price
        case title
    }
}
