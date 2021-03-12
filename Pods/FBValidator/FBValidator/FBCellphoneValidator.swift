//
//  FBCellphoneValidator.swift
//  FBValidator
//
//  Created by Felipe Correia on 19/06/20.
//  Copyright © 2020 felip38rito. All rights reserved.
//

import Foundation

/// Brazilian cellphone validator
open class FBCellphoneValidator: FBRegexValidator {
    public init() {
        let regex: String = {
            let ddd = "\\([0-9]{2}\\)"
            let body = "[0-9]{4,5}"
            let end  = "[0-9]{4}"

            return "\(ddd) \(body)-\(end)"
        }()
        
        super.init(regex)
    }
}
