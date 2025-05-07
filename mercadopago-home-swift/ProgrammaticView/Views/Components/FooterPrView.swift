//
//  FooterPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/02/2025.
//

import UIKit

class FooterPrView: UIView {
    
    private lazy var lastAccessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .grayInfo
        label.font = .customRegular(size: 12)
        label.text = NSLocalizedString("footer_last_login", parameters: Date().toDateTimeString())
        
        return label
    }()
    
    private lazy var disclaimerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .grayInfo
        label.font = .customRegular(size: 10)
        label.numberOfLines = .zero
        label.text = NSLocalizedString("footer_disclaimer")
        
        return label
    }()
    
    private lazy var contractLawLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightBlue
        label.font = .customRegular(size: 10)
        label.numberOfLines = .zero
        label.text = NSLocalizedString("footer_contract_law")
        
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightBlue
        label.font = .customRegular(size: 14)
        label.numberOfLines = .zero
        label.text = NSLocalizedString("footer_email")
        
        return label
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.backgroundColor = .clear
        
        stack.addArrangedSubview(lastAccessLabel)
        stack.addArrangedSubview(disclaimerLabel)
        stack.addArrangedSubview(contractLawLabel)
        stack.addArrangedSubview(emailLabel)
        
        return stack
    }()


    required init(){
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textStackView)

        NSLayoutConstraint.activate([
            textStackView.topAnchor.constraint(equalTo: self.topAnchor),
            textStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -24),
            textStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            textStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
