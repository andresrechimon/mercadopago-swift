//
//  PrSeparatorView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/02/2025.
//

import UIKit

class PrSeparatorView: UIView {
    let color: UIColor
    let stroke: CGFloat
    
    required init(color: UIColor = .strongGraySeparator, stroke: CGFloat = 1.0){
        self.color = color
        self.stroke = stroke
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = self.color

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: self.stroke)
        ])
    }
}
