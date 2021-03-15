//
//  Defaults+Extras.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import Defaults

extension Defaults.Keys {
    static let nome  = Key<String>("nome", default: "")
    static let email = Key<String>("email", default: "")
    //            ^            ^         ^                ^
    //           Key          Type   UserDefaults name   Default value
}
