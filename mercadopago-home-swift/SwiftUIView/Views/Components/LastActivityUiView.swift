//
//  LastActivityUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct LastActivityUiView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(NSLocalizedString("your_last_activity"))
                    .foregroundColor(.black)
                    .font(.customMedium(size: 18))
                Spacer()
                
                SeeAllButton()
            }
            
            VStack {
                LastActivityCellUiView(icon: "arrow.right.circle", title: "Roberto Malis", disclaimer: "Transferencia enviada", paymentMethod: "Dinero disponible", paymentMethodIcon: Image("mercado-pago-logo"), type: .expense, amount: 15000, date: Date())
                LastActivityCellUiView(icon: "arrow.right.circle", title: "Bruno Braconi", disclaimer: "Transferencia recibida", type: .income, amount: 15000, date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date())
                LastActivityCellUiView(icon: "bag", title: "Vez Sm 432", disclaimer: "Pago en tienda física", paymentMethod: "Mastercard Mercado Pago", paymentMethodIcon: Image("mercado-pago-empty-logo"), paymentMethodIconBg: .black, type: .expense, amount: 112003.55, date: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date())
            }
        }
        .padding(16)
        .containerStyle()
    }
}

struct SeeAllButton: View {
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 4) {
                Text(NSLocalizedString("see_all", comment: ""))
                    .font(.customMedium(size: 14))
                    .foregroundColor(.lightBlueEmptyButton)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.lightBlueEmptyButton)
            }
        }
    }
}

#Preview {
    LastActivityUiView()
}
