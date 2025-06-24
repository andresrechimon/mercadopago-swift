//
//  FooterUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct FooterUiView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(NSLocalizedString("footer_last_login", parameters: Date().toDateTimeString()))
                .foregroundColor(.grayInfo)
                .font(.customRegular(size: 12))
            
            Text(NSLocalizedString("footer_disclaimer"))
                .foregroundColor(.grayInfo)
                .font(.customRegular(size: 10))
            
            Text(NSLocalizedString("footer_contract_law"))
                .foregroundColor(.lightBlue)
                .font(.customRegular(size: 12))
            
            Text(NSLocalizedString("footer_email"))
                .foregroundColor(.lightBlue)
                .font(.customRegular(size: 14))
        }
    }
}

#Preview {
    FooterUiView()
}
