//
//  ProgrammaticHomeViewModel.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import Foundation

struct Offer {
    let banner: String
}

class ProgrammaticHomeViewModel {
    var offers: [Offer] = [
        Offer(banner: "banner-gb"),
        Offer(banner: "banner-gb"),
        Offer(banner: "banner-gb")
    ]
}
