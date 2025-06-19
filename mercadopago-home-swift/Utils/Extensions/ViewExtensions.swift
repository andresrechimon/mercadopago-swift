//
//  ViewExtensions.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 17/06/2025.
//

import SwiftUI

extension View {
    func containerStyle() -> some View {
        self
            .frame(maxWidth: .infinity)
            .background(.white)
            .cornerRadius(4)
            .padding(.horizontal, 16)
            .shadow(
                color: .black.opacity(0.1),
                radius: 4,
                x: 0,
                y: 2
            )
    }
}
