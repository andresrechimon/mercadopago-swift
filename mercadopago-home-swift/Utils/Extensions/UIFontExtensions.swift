//
//  UIFontExtensions.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/12/2024.
//

import UIKit

extension UIFont {
    static func customLight(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Figtree-Light", size: size) else {
            print("Error: No se pudo cargar la fuente Figtree-Light.ttf")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func customRegular(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Figtree-Regular", size: size) else {
            print("Error: No se pudo cargar la fuente Figtree-Regular")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func customMedium(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Figtree-Medium", size: size) else {
            print("Error: No se pudo cargar la fuente Figtree-Medium")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
    
    static func customBold(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Figtree-Bold", size: size) else {
            print("Error: No se pudo cargar la fuente Figtree-Bold")
            return UIFont.systemFont(ofSize: size)
        }
        return customFont
    }
}
