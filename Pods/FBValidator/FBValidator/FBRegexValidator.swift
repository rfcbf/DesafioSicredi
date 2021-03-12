//
//  FBRegexValidator.swift
//  FBValidator
//
//  Created by Felipe Correia on 19/06/20.
//  Copyright © 2020 felip38rito. All rights reserved.
//

import Foundation

/// Default validator
public protocol FBValidator {
    func isValid(_ text: String) -> Bool
}

/// Default Regular Expression Validator
open class FBRegexValidator: FBValidator {
    open var regex: String
    
    open func isValid(_ text: String) -> Bool {
        do {
            let regexTest = try NSRegularExpression(pattern: regex)
            return regexTest.firstMatch(in: text, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, text.count)) != nil
        
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    public init(_ regex: String) {
        self.regex = regex
    }
}
