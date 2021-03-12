//
//  FBRequiredValidator.swift
//  FBValidator
//
//  Created by Felipe Correia on 19/06/20.
//  Copyright © 2020 felip38rito. All rights reserved.
//

import Foundation

/// Garante que nao seja um texto vazio, ou apenas com espaços
public class FBRequiredValidator: FBValidator {
    public func isValid(_ text: String) -> Bool {
        return text.replacingOccurrences(of: " ", with: "") != ""
    }
    
    public init() {
        
    }
}
