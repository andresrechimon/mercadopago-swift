//
//  RecomendationCellPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 02/01/2025.
//

import UIKit

struct Recommendation {
    let icon: String
    let message: String
}

class RecomendationCellPrView: UIView {
    private let recommendation: Recommendation
    
    private lazy var circleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightBlue
        
        let circleUnits: CGFloat = 30
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: circleUnits),
            view.widthAnchor.constraint(equalToConstant: circleUnits),
        ])
        
        view.layer.cornerRadius = circleUnits / 2
        
        return view
    }()
    
    private lazy var circleIconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        image.image = UIImage(systemName: self.recommendation.icon)?.withConfiguration(configuration)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 25),
            image.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        return image
    }()
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.font = .customRegular(size: 16)
        label.textColor = .black
        label.text = self.recommendation.message
        
        return label
    }()
    
    required init(recommendation: Recommendation){
        self.recommendation = recommendation
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.addSubview(circleContainerView)
        circleContainerView.addSubview(circleIconView)
        
        self.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            circleContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            circleContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            circleContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            circleIconView.centerYAnchor.constraint(equalTo: circleContainerView.centerYAnchor),
            circleIconView.centerXAnchor.constraint(equalTo: circleContainerView.centerXAnchor),
            
            messageLabel.centerYAnchor.constraint(equalTo: circleContainerView.centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: circleContainerView.trailingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
