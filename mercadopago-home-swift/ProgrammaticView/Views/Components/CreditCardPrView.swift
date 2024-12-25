//
//  CreditCardPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/12/2024.
//

import UIKit

class CreditCardPrView: UIView {
    
    private lazy var brandImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "mastercard-logo")
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        return image
    }()
    
    private lazy var mercadoPagoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "mercado-pago-empty-logo")
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        return image
    }()
    
    private lazy var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 8
        stack.addArrangedSubview(brandImageView)
        stack.addArrangedSubview(mercadoPagoImageView)
        
        return stack
    }()
    
    private lazy var titleCardLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.text = NSLocalizedString("mp_card")
        
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .white
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 12),
            image.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        return image
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.addArrangedSubview(titleCardLabel)
        stack.addArrangedSubview(arrowImageView)
        
        return stack
    }()
    
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
        self.backgroundColor = .blackCardBackground
        
        self.addSubview(topStackView)
        self.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            
            bottomStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
