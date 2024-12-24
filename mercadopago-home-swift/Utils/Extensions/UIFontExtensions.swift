//
//  UIFontExtensions.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/12/2024.
//

import UIKit

extension UIFont {
    static func noyhRegular(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "NoyhR-Regular", size: size) else {
            print("Error: No se pudo cargar la fuente NoyhR-Regular")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func noyhMedium(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "NoyhR-Medium", size: size) else {
            print("Error: No se pudo cargar la fuente NoyhR-Medium")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func noyhBold(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "NoyhR-Bold", size: size) else {
            print("Error: No se pudo cargar la fuente NoyhR-Bold")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}
