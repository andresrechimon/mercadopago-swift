//
//  BadgeUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import SwiftUI

struct BadgeUiView: View {
    var title: String
    var color: Color
    
    var body: some View {
        Text(self.title)
            .textCase(.uppercase)
            .font(.customBold(size: 10))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
            .background(self.color)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    BadgeUiView(title: NSLocalizedString("new"), color: .royalBlue)
}
