//
//  RecomendationsPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 02/01/2025.
//

import UIKit

class RecomendationsPrView: UIView {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var recommendationsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 1
        stack.backgroundColor = .graySeparator
        
        
        return stack
    }()
    
    private func setupRecommendationsView() {
        let recommendations: [Recommendation] = [
            Recommendation(icon: "gift", message: NSLocalizedString("recommend_app_message")),
            Recommendation(icon: "banknote", message: NSLocalizedString("recommend_point_message"))
        ]
        
        recommendations.forEach { recommendation in
            let view = RecomendationCellPrView(recommendation: recommendation)
            recommendationsStackView.addArrangedSubview(view)
        }
    }


    required init(){
        super.init(frame: CGRect.zero)
        self.applyStyle()
        self.setupRecommendationsView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.applyContainerStyles()
        containerView.addSubview(recommendationsStackView)

        NSLayoutConstraint.activate([
            recommendationsStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            recommendationsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            recommendationsStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            recommendationsStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
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
