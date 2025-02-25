//
//  DateExtensions.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 02/01/2025.
//

import Foundation

extension Date {
    func toDateAbbrev(format: String = "dd/MMM") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "es_ES")
        return formatter.string(from: self).lowercased()
    }
    
    func toDateTimeString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM 'de' yyyy '·' HH:mm 'hs.'"
        dateFormatter.locale = Locale(identifier: "es_ES")
        return dateFormatter.string(from: self)
    }}
