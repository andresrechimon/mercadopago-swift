//
//  UiSeparatorView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct UiSeparatorView: View {
    var body: some View {
        Rectangle()
            .fill(.strongGraySeparator)
            .frame(height: 1)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 16)
    }
}

#Preview {
    UiSeparatorView()
}
