//
//  ServicesBlockPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import UIKit

struct ServiceOption {
    let icon: String
    let title: String
    let color: UIColor
    let serviceOffer: String
}

class ServicesBlockPrView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //OPTIONS
    private lazy var upperStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private func setupUpperOptionsView() {
        let upperOptions: [ServiceOption] = [
            ServiceOption(
                icon: "doc.plaintext",
                title: NSLocalizedString("accounts_services_title"),
                color: .lightBlueButton,
                serviceOffer: ""
            ),
            ServiceOption(
                icon: "iphone.gen1.and.arrow.left",
                title: NSLocalizedString("recharge_mobile_title"),
                color: .lightBlueButton,
                serviceOffer: ""
            ),
            ServiceOption(
                icon: "bus.fill",
                title: NSLocalizedString("transport_title"),
                color: .lightBlueButton,
                serviceOffer: ""
            ),
            ServiceOption(
                icon: "antenna.radiowaves.left.and.right",
                title: NSLocalizedString("directv_title"),
                color: .lightBlueButton,
                serviceOffer: ""
            )
        ]
        
        upperOptions.forEach { option in
            let view = ServicesOptionPrView(icon: option.icon, title: option.title, color: option.color, serviceOffer: option.serviceOffer)
            upperStackView.addArrangedSubview(view)
        }
    }

    private func setupBottomOptionsView() {
        let bottomOptions: [ServiceOption] = [
            ServiceOption(
                icon: "creditcard.and.123",
                title: NSLocalizedString("point_title"),
                color: .opaquePurple,
                serviceOffer: ""
            ),
            ServiceOption(
                icon: "link",
                title: NSLocalizedString("payment_link_title"),
                color: .opaquePurple,
                serviceOffer: ""
            ),
            ServiceOption(
                icon: "gift",
                title: NSLocalizedString("recommend_app_title"),
                color: .goldenMp,
                serviceOffer: NSLocalizedString("recommend_app_offer")
            ),
            ServiceOption(
                icon: "plus",
                title: NSLocalizedString("see_more_title"),
                color: .strongGray,
                serviceOffer: ""
            )
        ]
        
        bottomOptions.forEach { option in
            let view = ServicesOptionPrView(icon: option.icon, title: option.title, color: option.color, serviceOffer: option.serviceOffer)
            bottomStackView.addArrangedSubview(view)
        }
    }
    
    private lazy var servicesStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(upperStackView)
        stack.addArrangedSubview(bottomStackView)
        
        return stack
    }()
    //OPTIONS
    
    required init() {
        super.init(frame: CGRect.zero)
        self.applyStyle()
        self.setupUpperOptionsView()
        self.setupBottomOptionsView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.applyContainerStyles()
        containerView.addSubview(servicesStackView)
        
        NSLayoutConstraint.activate([
            servicesStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            servicesStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            servicesStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            servicesStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func applyContainerStyles() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 4
        containerView.applyShadow()
        
        self.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
