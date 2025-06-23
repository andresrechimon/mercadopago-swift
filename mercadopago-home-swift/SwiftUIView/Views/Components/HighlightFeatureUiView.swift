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
    var mainInfo: String?
    var subInfo: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack{
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
            
            if let mainInfo = self.mainInfo {
                Text(mainInfo)
                    .foregroundColor(.black)
                    .font(.customBold(size: 24))
            }
            
            Text(self.subInfo)
                .foregroundColor(.black)
                .font(.customRegular(size: 12))
        }
        .padding(16)
        .containerStyle()
    }
}

#Preview {
    HighlightFeatureUiView(icon: "dollarsign.ring.dashed", title: NSLocalizedString("dollars_title"), subInfo: NSLocalizedString("dollars_info", parameters: "$ \(1173.58.toCurrency())", "$ \(1172.36.toCurrency())"))
}
