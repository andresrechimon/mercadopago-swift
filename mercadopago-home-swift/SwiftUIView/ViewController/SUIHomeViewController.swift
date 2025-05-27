//
//  SUIHomeViewController.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 10/03/2025.
//

import SwiftUI

struct SUIHomeViewController: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LightBlueGradientView()
            VStack() {
                HeaderUiView(
                    username: "Andrés Rechimon",
                    onTapCircle: {
                        dismiss()
                    }
                )
                Spacer()
            }
        }
    }
}

#Preview {
    SUIHomeViewController()
}
