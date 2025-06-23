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
    var subInfo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: self.icon)
                        .frame(width: 20, height: 20)
                    Text(self.title)
                        .foregroundColor(.black)
                        .font(.customMedium(size: 18))
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.lightBlueEmptyButton)
            }
            
            if title == NSLocalizedString("dollars_title") {
                formattedAmount(569.69)
                    .foregroundColor(.black)
            }
            
            Text(self.subInfo)
                .foregroundColor(.black)
                .font(.customRegular(size: 12))
        }
        .padding(16)
        .containerStyle()
    }
    
    @ViewBuilder
    private func formattedAmount(_ amount: Double) -> some View {
        let amountString = amount.toCurrency()
        let components = amountString.components(separatedBy: ",")
        
        if components.count == 2 {
            let wholeNumber = components[0]
            let decimals = components[1]
            
            (Text("US$ \(wholeNumber)")
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
