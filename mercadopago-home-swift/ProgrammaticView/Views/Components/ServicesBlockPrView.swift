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
            ServiceOption(icon: "arrow.up.circle", title: "Cuentas y\nservicios"),
            ServiceOption(icon: "arrow.right.circle", title: "Recargar\ncelular"),
            ServiceOption(icon: "arrow.down.circle", title: "Cargar\ntransporte"),
            ServiceOption(icon: "person.text.rectangle", title: "Recargar\nDIRECTV")
        ]
        
        upperOptions.forEach { option in
            let view = ServicesOptionPrView(icon: option.icon, title: option.title)
            upperStackView.addArrangedSubview(view)
        }
    }
    
    private func setupBottomOptionsView() {
        let bottomOptions: [ServiceOption] = [
            ServiceOption(icon: "arrow.up.circle", title: "Cobrar\ncon Point"),
            ServiceOption(icon: "arrow.right.circle", title: "Cobrar con\nlink de pago"),
            ServiceOption(icon: "arrow.down.circle", title: "Navidad"),
            ServiceOption(icon: "person.text.rectangle", title: "Ver más")
        ]
        
        bottomOptions.forEach { option in
            let view = ServicesOptionPrView(icon: option.icon, title: option.title)
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
