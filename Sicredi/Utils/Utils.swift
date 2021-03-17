//
//  Utils.swift
//  Sicredi
//
//  Created by Renato Ferraz on 15/03/21.
//

import Foundation

public class Utils {
    
    func convertFloatToMoney(_ value : Double) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.alwaysShowsDecimalSeparator = true
        currencyFormatter.decimalSeparator = ","
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        
        let priceString = currencyFormatter.string(from: NSNumber(value: value))!
        return priceString
    }
    
    func convertDateToString(_ value: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/YYYY HH:mm"
        
        // Convert Date to String
        return dateFormatter.string(from: value)
    }
    
}
