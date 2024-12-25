//
//  ServicesOptionPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import UIKit

class ServicesOptionPrView: UIView {
    private var icon: String
    private var title: String
    private var color: UIColor
    
    private lazy var optionContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.grayBackground.cgColor
        
        let circleUnits: CGFloat = 55
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: circleUnits),
            view.widthAnchor.constraint(equalToConstant: circleUnits),
        ])
        
        view.layer.cornerRadius = circleUnits / 2
        
        return view
    }()
    
    private lazy var optionIconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        image.image = UIImage(systemName: self.icon)?.withConfiguration(configuration)
        image.tintColor = self.color
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .noyhRegular(size: 13)
        label.textAlignment = .center
        label.numberOfLines = .zero
        label.text = self.title
        
        return label
    }()
    
    required init(icon: String, title: String, color: UIColor){
        self.icon = icon
        self.title = title
        self.color = color
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(optionContainerView)
        self.addSubview(optionIconView)
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            optionContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            optionContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            optionContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            optionIconView.centerXAnchor.constraint(equalTo: optionContainerView.centerXAnchor),
            optionIconView.centerYAnchor.constraint(equalTo: optionContainerView.centerYAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: optionContainerView.bottomAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: optionContainerView.centerXAnchor)
        ])
    }
}
