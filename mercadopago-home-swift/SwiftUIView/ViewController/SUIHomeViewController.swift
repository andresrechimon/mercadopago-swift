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
                ScrollView {
                    VStack(spacing: 24) {
                        TransferBlockUiView()
                        
                        HighlightFeatureUiView(icon: "dollarsign.ring.dashed", title: NSLocalizedString("dollars_title"), mainInfo: "US$ \(569.69.toCurrency())", subInfo: NSLocalizedString("dollars_info", parameters: "$ \(1173.58.toCurrency())", "$ \(1172.36.toCurrency())"))
                        
                        ServicesBlockUiView()
                    }
                }
            }
        }
    }
}

#Preview {
    SUIHomeViewController()
}
