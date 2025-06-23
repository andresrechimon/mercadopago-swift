//
//  OfferCarouselUiViewCell.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import SwiftUI

struct OfferCarouselUiViewCell: View {
    var offer: Offer
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Rectangle()
                .fill(Color.clear)
                .frame(width: 370, height: 90)
                .background(
                    Image(self.offer.banner)
                        .resizable()
                        .scaledToFill()
                )
                .clipped()
                .cornerRadius(8)
                .shadow(radius: 4)

            ZStack {
                Circle()
                    .fill(.grayBackground)
                    .frame(width: 15, height: 15)
                
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 8, height: 8)
                    .font(.system(size: 8, weight: .light))
                    .foregroundColor(.black)
            }
            .offset(x: -8, y: 8)
        }
    }
}

#Preview {
    OfferCarouselUiViewCell(offer: Offer(banner: "banner-gb"))
}
