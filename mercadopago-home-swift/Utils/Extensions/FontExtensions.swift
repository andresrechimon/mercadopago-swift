//
//  FontExtensions.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 27/05/2025.
//

import SwiftUI

extension Font {
    static func customLight(size: CGFloat) -> Font {
        Font.custom("Figtree-Light", size: size)
    }

    static func customRegular(size: CGFloat) -> Font {
        Font.custom("Figtree-Regular", size: size)
    }
    
    static func customMedium(size: CGFloat) -> Font {
        Font.custom("Figtree-Medium", size: size)
    }
    
    static func customBold(size: CGFloat) -> Font {
        Font.custom("Figtree-Bold", size: size)
    }
}

