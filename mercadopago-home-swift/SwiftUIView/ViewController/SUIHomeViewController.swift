//
//  SUIHomeViewController.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 10/03/2025.
//

import SwiftUI

struct SUIHomeViewController: View {
    @Environment(\.dismiss) private var dismiss
    private var viewModel: SUIHomeViewModel = .init()
    
    var body: some View {
        ZStack {
            LightBlueGradientView()
            VStack() {
                HeaderUiView(
                    username: "Andrés Rechimon",
                    onTapCircle: {
                        dismiss()
                    }
                )
                ScrollView {
                    VStack(spacing: 24) {
                        TransferBlockUiView()
                        
                        HighlightFeatureUiView(icon: "dollarsign.ring.dashed", title: NSLocalizedString("dollars_title"), value: CurrencyAmount(currency: .dollar, amount: 569.69, percentage: 2.6), subInfo: NSLocalizedString("dollars_info", parameters: "$ \(1173.58.toCurrency())", "$ \(1172.36.toCurrency())"))
                        
                        ServicesBlockUiView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(self.viewModel.offers) { offer in
                                    OfferCarouselUiViewCell(offer: offer)
                                }
                            }
                            .padding(.horizontal, 16)
                        }

                        HighlightFeatureUiView(icon: "hands.sparkles", title: NSLocalizedString("credits_title"), subInfo: NSLocalizedString("credits_info", parameters: "$ \(2103473.toCurrency())"))
                        
                        HighlightFeatureUiView(icon: "dollarsign.bank.building", title: NSLocalizedString("reserves_title"), value: CurrencyAmount(currency: .peso, amount: 0.50, percentage: 26.4))
                        
                        HighlightFeatureUiView(icon: "shield", title: NSLocalizedString("insurance_title"), subInfo: NSLocalizedString("insurance_info_new"), isNew: true)
                        
                        PromoBannerUiView(image: "banner-meli+")
                        
                        LastActivityUiView()
                        
                        UiButton(icon: "receipt", title: NSLocalizedString("repentance_title"))
                        UiButton(icon: "person", title: NSLocalizedString("cancel_account_title"))
                        UiButton(icon: "text.bubble.rtl", title: NSLocalizedString("experience_home_title"))
                        
                        UiSeparatorView()
                    }
                }
            }
        }
    }
}

#Preview {
    SUIHomeViewController()
}
