//
//  HighlightFeatureUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import SwiftUI

struct HighlightFeatureUiView: View {
    var icon: String
    var title: String
    var value: CurrencyAmount?
    var subInfo: String?
    var isNew: Bool?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: self.icon)
                        .frame(width: 20, height: 20)
                    Text(self.title)
                        .foregroundColor(.black)
                        .font(.customMedium(size: 18))
                    
                    if let _ = self.isNew {
                        BadgeUiView(title: NSLocalizedString("new"), color: .royalBlue)
                    }
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.lightBlueEmptyButton)
            }
            
            if let value = self.value {
                HStack {
                    formattedAmount(value)
                        .foregroundColor(.black)
                    
                    RemunerationUiView(icon: "▴", percentage: value.percentage, bgColor: .backgroundNumberPlus, textColor: .numberPlus)
                }
            }
            
            if let subInfo = self.subInfo {
                Text(subInfo)
                    .foregroundColor(.black)
                    .font(.customRegular(size: 12))
            }
        }
        .padding(16)
        .containerStyle()
    }
    
    @ViewBuilder
    private func formattedAmount(_ value: CurrencyAmount) -> some View {
        let amountString = value.amount.toCurrency()
        let components = amountString.components(separatedBy: ",")
        
        if components.count == 2 {
            let wholeNumber = components[0]
            let decimals = components[1]
            
            (Text("\(value.currency.rawValue) \(wholeNumber)")
                .font(.customBold(size: 24))
             +
             Text(" \(decimals)")
                .font(.customRegular(size: 12))
                .baselineOffset(8)
            )
        } else {
            Text(amountString)
                .font(.customBold(size: 24))
        }
    }
}

#Preview {
    HighlightFeatureUiView(
        icon: "dollarsign.ring.dashed",
        title: NSLocalizedString("dollars_title"),
        subInfo: NSLocalizedString("dollars_info", parameters: "$ \(1173.58.toCurrency())", "$ \(1172.36.toCurrency())")
    )
}
