//
//  LastActivityPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 02/01/2025.
//

import UIKit

class LastActivityPrView: UIView {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .customMedium(size: 18)
        label.text = NSLocalizedString("your_last_activity")
        
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .customMedium(size: 14)
        button.setTitleColor(.lightBlueEmptyButton, for: .normal)
        button.setTitle(NSLocalizedString("see_all"), for: .normal)
        
        let symbolConfig = UIImage.SymbolConfiguration(
            pointSize: 14,
            weight: .regular,
            scale: .small
        )
        
        let chevronImage = UIImage(systemName: "chevron.right", withConfiguration: symbolConfig)
        button.setImage(chevronImage, for: .normal)
        button.tintColor = .lightBlueEmptyButton
        
        button.semanticContentAttribute = .forceRightToLeft
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 0)
        
        return button
    }()
    
    private lazy var lastActivityStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        
        
        return stack
    }()
    
    private func setupLastActivityView() {
        let lastActivities: [LastActivity] = [
            LastActivity(icon: "arrow.right.circle", title: "Roberto Malis", disclaimer: "Transferencia enviada", paymentMethod: "Dinero disponible", paymentMethodIcon: UIImage(named: "mercado-pago-logo")!, amount: 6300.50, date: Date(), type: .expense),
            
            LastActivity(icon: "bag", title: "Vez Sm 432", disclaimer: "Pago en tienda física", paymentMethod: "Mastercard Mercado Pago", paymentMethodIcon: UIImage(named: "mercado-pago-empty-logo")!, paymentMethodIconBg: .blackCardBackground, amount: 16403, date: Date(), type: .expense),
            
            LastActivity(icon: "arrow.up.circle", title: "Ingreso de dinero", paymentMethod: "Con transferencia", paymentMethodIcon: UIImage(systemName: "dollarsign.bank.building")!, amount: 1095.90, date: Date(), type: .income),
        ]
        
        lastActivities.forEach { lastActivity in
            let view = LastActivityCellPrView(lastActivity: lastActivity)
            lastActivityStackView.addArrangedSubview(view)
        }
    }

    required init(){
        super.init(frame: CGRect.zero)
        self.applyStyle()
        self.setupLastActivityView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.applyContainerStyles()
        containerView.addSubview(titleLabel)
        containerView.addSubview(seeAllButton)
        containerView.addSubview(lastActivityStackView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            seeAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            lastActivityStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            lastActivityStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            lastActivityStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            lastActivityStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ])
    }
    
    private func applyContainerStyles(){
        containerView.containerStyle()
        
        self.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
