//
//  UiButton.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct UiButton: View {
    let icon: String
    let title: String
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(.paleBlue)
                        .frame(width: 35, height: 35)
                    Image(systemName: self.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.azureBlue)
                        .font(.system(size: 20, weight: .light))
                }
                Text(self.title)
                    .foregroundColor(.black)
                    .font(.customRegular(size: 16))
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 12, height: 12)
                    .foregroundColor(.lightBlueEmptyButton)
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
        }
        .containerStyle()
    }
}

#Preview {
    UiButton(icon: "receipt", title: NSLocalizedString("repentance_title"))
    UiButton(icon: "person", title: NSLocalizedString("cancel_account_title"))
    UiButton(icon: "text.bubble.rtl", title: NSLocalizedString("experience_home_title"))
}
