//
//  PromoBannerUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import SwiftUI

struct PromoBannerUiView: View {
    let image: String
    
    var body: some View {
        Image(self.image)
            .resizable()
            .frame(width: 370, height: 140)
            .clipped()
            .cornerRadius(8)
    }
}

#Preview {
    PromoBannerUiView(image: "banner-meli+")
}
