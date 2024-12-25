//
//  Localization.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import Foundation

import Foundation

func NSLocalizedString(_ key: String, text parameter: CVarArg? = nil) -> String {
    let localizedString = NSLocalizedString(key, comment: "")
    
    if let parameter = parameter {
        return String(format: localizedString, parameter)
    } else {
        return localizedString
    }
}
