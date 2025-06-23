//
//  CurrencyAmount.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import Foundation

struct CurrencyAmount {
    let currency: Currency
    let amount: Double
    let percentage: Double
    
    enum Currency: String {
        case peso = "$"
        case dollar = "US$"
    }
}
