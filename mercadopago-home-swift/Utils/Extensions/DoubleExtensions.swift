//
//  DoubleExtensions.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/12/2024.
//

import Foundation

extension Double {
    func toCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        formatter.decimalSeparator = ","
        formatter.groupingSeparator = "."
        
        return formatter.string(from: NSNumber(value: self)) ?? "0,00"
    }
    
    func toPercentage() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        formatter.decimalSeparator = ","
        
        return (formatter.string(from: NSNumber(value: self)) ?? "0,0") + "%"
    }
}
