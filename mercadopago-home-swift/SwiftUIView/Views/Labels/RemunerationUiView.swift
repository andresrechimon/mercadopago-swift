//
//  RemunerationUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 17/06/2025.
//

import SwiftUI

struct RemunerationUiView: View {
    var icon: String
    var percentage: Double
    var bgColor: Color
    var textColor: Color
    
    var body: some View {
        HStack(spacing: 2) {
            Text(self.icon)
                .foregroundColor(self.textColor)
                .font(.customBold(size: 8))
            
            Text(self.percentage.toPercentage())
                .foregroundColor(self.textColor)
                .font(.customBold(size: 10))
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 4)
        .background(self.bgColor)
        .cornerRadius(8)
    }
}

#Preview {
    RemunerationUiView(icon: "▴", percentage: 32.4, bgColor: .backgroundNumberPlus, textColor: .numberPlus)
}
