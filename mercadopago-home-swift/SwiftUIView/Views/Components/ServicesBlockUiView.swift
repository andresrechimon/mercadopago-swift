//
//  ServicesBlockUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/06/2025.
//

import SwiftUI

struct ServicesBlockUiView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack(alignment: .top) {
                ServicesOptionUiView(icon: "doc.plaintext", title: NSLocalizedString("accounts_services_title"), color: .blue)
                Spacer()
                ServicesOptionUiView(icon: "iphone.gen1.and.arrow.left", title: NSLocalizedString("recharge_mobile_title"), color: .blue)
                Spacer()
                ServicesOptionUiView(icon: "bus.fill", title: NSLocalizedString("transport_title"), color: .blue)
                Spacer()
                ServicesOptionUiView(icon: "antenna.radiowaves.left.and.right", title: NSLocalizedString("directv_title"), color: .blue)
            }
            HStack(alignment: .top) {
                ServicesOptionUiView(icon: "creditcard.and.123", title: NSLocalizedString("point_title"), color: .deepIndigo)
                Spacer()
                ServicesOptionUiView(icon: "link", title: NSLocalizedString("payment_link_title"), color: .deepIndigo)
                Spacer()
                ServicesOptionUiView(icon: "gift", title: NSLocalizedString("no_cap"), color: .deepIndigo, withOffer: true)
                Spacer()
                ServicesOptionUiView(icon: "plus", title: NSLocalizedString("see_more_title"), color: .strongGray)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .containerStyle()
    }
}

#Preview {
    ServicesBlockUiView()
}
