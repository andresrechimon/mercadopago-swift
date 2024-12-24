//
//  CreditCardView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/12/2024.
//

import UIKit

class CreditCardView: UIView {
    
    required init(){
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4
        
        NSLayoutConstraint.activate([
            
        ])
    }
}
