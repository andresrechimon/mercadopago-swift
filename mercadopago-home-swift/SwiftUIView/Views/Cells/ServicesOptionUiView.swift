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
    var withOffer: Bool = false
    
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

                ImageView()
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.getSize(), height: self.getSize())
                    .foregroundColor(self.color)
                    .font(.system(size: self.getSize(), weight: .light))
                
                if self.withOffer {
                    Text(NSLocalizedString("no_cap_offer"))
                        .font(.customBold(size: 10))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                        .background(Color.emeraldGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .offset(y: 28)
                }
            }
            
            Text(self.title)
                .foregroundColor(.black)
                .font(.customLight(size: 12))
                .multilineTextAlignment(.center)
        }
    }
    
    private func ImageView() -> Image {
        if self.withOffer {
            return Image("vea-logo")
        }
        
        return Image(systemName: self.icon)
    }
    
    private func getSize() -> CGFloat {
        self.color == .strongGray ? 20 : 30
    }
}

#Preview {
    ServicesOptionUiView(icon: "arrow.up.circle", title: NSLocalizedString("deposit"), color: .lightBlueButton)
}
