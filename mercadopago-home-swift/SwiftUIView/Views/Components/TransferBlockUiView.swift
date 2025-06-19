//
//  TransferBlockUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 17/06/2025.
//

import SwiftUI

struct TransferBlockUiView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                AvailableLabel()
                RemunerationUiView(icon: "▴", percentage: 32.4, bgColor: .backgroundNumberPlus, textColor: .numberPlus)
                Spacer()
                MovesButton()
            }
            
            HStack(spacing: 8) {
                MoneyLabel()
                EyeContainerView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 4)
            
            TransferOptionView()
            
            CreditCardView()
        }
        .padding(.top, 12)
        .padding([.horizontal, .bottom], 16)
        .containerStyle()
    }
}

struct AvailableLabel: View {
    var text: String = NSLocalizedString("available")
    var font: Font = .customMedium(size: 14)
    
    var body: some View {
        Text(text)
            .font(font)
            .foregroundColor(.black)
    }
}

struct MovesButton: View {
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 4) {
                Text(NSLocalizedString("go_to_moves", comment: ""))
                    .font(.customMedium(size: 14))
                    .foregroundColor(.lightBlueEmptyButton)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.lightBlueEmptyButton)
            }
        }
    }
}

struct MoneyLabel: View {
    private let amount: Double = 78325.61
    
    var body: some View {
        let amountString = amount.toCurrency()
        let components = amountString.components(separatedBy: ",")
        
        if components.count == 2 {
            let wholeNumber = components[0]
            let decimals = components[1]
            
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text("$")
                    .font(.customBold(size: 28))
                
                Text(wholeNumber)
                    .font(.customBold(size: 28))
                
                Text(" \(decimals)")
                    .font(.customRegular(size: 12))
                    .baselineOffset(11)
            }
            .foregroundColor(.black)
        } else {
            Text(amountString)
                .font(.customBold(size: 28))
                .foregroundColor(.black)
        }
    }
}

struct EyeContainerView: View {
    private let circleUnits: CGFloat = 30
    
    var body: some View {
        Image(systemName: "eye")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .foregroundColor(.black)
    }
}

struct TransferOptionView: View {
    var body: some View {
        HStack {
            TransferOptionUiView(icon: "arrow.up.circle", title: NSLocalizedString("deposit"))
            Spacer()
            TransferOptionUiView(icon: "arrow.right.circle", title: NSLocalizedString("transfer"))
            Spacer()
            TransferOptionUiView(icon: "arrow.down.circle", title: NSLocalizedString("withdraw"))
            Spacer()
            TransferOptionUiView(icon: "person.text.rectangle", title: NSLocalizedString("your_cvu"))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 12)
    }
}

struct CreditCardView: View {
    var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 8) {
                    Image("mastercard-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                    
                    Image("mercado-pago-empty-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                }
                .padding(.top, 8)
                .padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                HStack {
                    Text(NSLocalizedString("mp_card_ui"))
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 8, height: 8)
                        .foregroundColor(.white)
                }
                .padding([.leading, .trailing, .bottom], 8)
            }
            .frame(height: 85)
            .background(.blackCardBackground)
            .cornerRadius(4)
            .padding(.top, 16)
        }
}

#Preview {
    TransferBlockUiView()
}
