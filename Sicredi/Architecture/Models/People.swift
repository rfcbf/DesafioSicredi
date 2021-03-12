//
//  People.swift
//  Sicredi
//
//  Created by Renato Ferraz on 12/03/21.
//

import SwiftUI

struct People: Codable {
    
    var nome: String
    var email: String
    
    enum CodingKeys : String, CodingKey {
        case nome
        case email
    }
}
