//
//  Localization.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import Foundation

func NSLocalizedString(_ key: String, parameters: CVarArg...) -> String {
    let localizedString = NSLocalizedString(key, comment: "")
    
    if !parameters.isEmpty {
        return String(format: localizedString, arguments: parameters)
    } else {
        return localizedString
    }
}
