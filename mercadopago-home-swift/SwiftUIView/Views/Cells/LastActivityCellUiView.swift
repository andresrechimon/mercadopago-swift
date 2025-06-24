//
//  LastActivityCellUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct LastActivityCellUiView: View {
    let icon: String
    let title: String
    let disclaimer: String
    var paymentMethod: String?
    var paymentMethodIcon: Image?
    var paymentMethodIconBg: Color = .white
    let type: TypeBalance
    let amount: Double
    let date: Date
    
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(.grayBackground)
                    .frame(width: 55, height: 55)
                Image(systemName: self.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .light))
            }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(self.title)
                        .foregroundColor(.black)
                        .font(.customMedium(size: 16))
                    
                    Spacer()
                    
                    Text(self.getAmountFormatted())
                        .foregroundColor(self.getAmountColor())
                        .font(.customRegular(size: 14))
                }
            
                HStack {
                    Text(self.disclaimer)
                        .foregroundColor(.grayInfo)
                        .font(.customRegular(size: 12))
                    
                    Spacer()
                    
                    Text(self.date.toDateAbbrev())
                        .foregroundColor(.grayInfo)
                        .font(.customRegular(size: 12))
                }
                
                if let paymentMethod = self.paymentMethod, let paymentMethodIcon = self.paymentMethodIcon {
                    HStack(spacing: 4) {
                        Circle()
                            .fill(paymentMethodIconBg)
                            .frame(width: 15, height: 15)
                            .overlay(
                                paymentMethodIcon
                                    .resizable()
                                    .padding(paymentMethodIconBg == .white ? 0 : 3)
                            )
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 1.5)
                                    .foregroundColor(.grayBackground)
                                    .opacity(paymentMethodIconBg == .white ? 1 : 0)
                            )
                        
                        Text(paymentMethod)
                            .foregroundColor(.grayInfo)
                            .font(.customRegular(size: 12))
                    }
                }
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 16)
    }
    
    private func getAmountFormatted() -> String {
        let sign: String = self.type == .expense ? "-" : "+"
        
        
        return "\(sign) $ \(self.amount.toCurrency())"
    }
    
    private func getAmountColor() -> Color {
        self.type == .expense ? .black : .numberPlus
    }
}

#Preview {
    LastActivityCellUiView(icon: "arrow.right.circle", title: "Roberto Malis", disclaimer: "Transferencia enviada", paymentMethod: "Dinero disponible", paymentMethodIcon: Image("mercado-pago-logo"), type: .expense, amount: 15000, date: Date())
    LastActivityCellUiView(icon: "arrow.right.circle", title: "Bruno Braconi", disclaimer: "Transferencia recibida", type: .income, amount: 15000, date: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date())
    LastActivityCellUiView(icon: "bag", title: "Vez Sm 432", disclaimer: "Pago en tienda física", paymentMethod: "Mastercard Mercado Pago", paymentMethodIcon: Image("mercado-pago-empty-logo"), paymentMethodIconBg: .black, type: .expense, amount: 112003.55, date: Calendar.current.date(byAdding: .day, value: -7, to: Date()) ?? Date())
}
