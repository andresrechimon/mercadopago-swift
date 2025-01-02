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
}
