//
//  TransferOptionUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 19/06/2025.
//

import SwiftUI

struct TransferOptionUiView: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack {
                Circle()
                    .fill(.paleBlue)
                    .frame(width: 55, height: 55)
                Image(systemName: self.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.azureBlue)
                    .font(.system(size: 30, weight: .light))
            }
            Text(self.title)
                .foregroundColor(.black)
                .font(.customLight(size: 12))
        }
    }
}

#Preview {
    TransferOptionUiView(icon: "arrow.up.circle", title: NSLocalizedString("deposit"))
}
