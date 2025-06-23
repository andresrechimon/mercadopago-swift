//
//  ServicesOptionUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import SwiftUI

struct ServicesOptionUiView: View {
    var icon: String
    var title: String
    var color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack {
                Circle()
                    .fill(.white)
                    .frame(width: 55, height: 55)
                    .overlay(
                            Circle()
                                .stroke(.grayBackground, lineWidth: 1.5)
                    )
                Image(systemName: self.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.getSize(), height: self.getSize())
                    .foregroundColor(self.color)
                    .font(.system(size: self.getSize(), weight: .light))
            }
            Text(self.title)
                .foregroundColor(.black)
                .font(.customLight(size: 12))
                .multilineTextAlignment(.center)
        }
    }
    
    private func getSize() -> CGFloat {
        self.color == .strongGray ? 20 : 30
    }
}

#Preview {
    ServicesOptionUiView(icon: "arrow.up.circle", title: NSLocalizedString("deposit"), color: .lightBlueButton)
}
