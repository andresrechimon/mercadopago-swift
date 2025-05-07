//
//  RemunerationPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 01/01/2025.
//

import UIKit

class RemunerationPrView: UIView {
    private var icon: String
    private var percentage: Double
    private var bgColor: UIColor
    private var textColor: UIColor
    
    private lazy var remunerationContainerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [remunerationSignLabel, remunerationPerLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 2
        
        return stackView
    }()
    
    private lazy var remunerationSignLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .backgroundNumberPlus
        label.textColor = self.textColor
        label.font = .customBold(size: 8)
        label.text = self.icon
        
        return label
    }()
    
    private lazy var remunerationPerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .backgroundNumberPlus
        label.textColor = self.textColor
        label.font = .customBold(size: 10)
        label.text = self.percentage.toPercentage()
        
        return label
    }()

    required init(icon: String, percentage: Double, bgColor: UIColor, textColor: UIColor){
        self.icon = icon
        self.percentage = percentage
        self.bgColor = bgColor
        self.textColor = textColor
        
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = self.bgColor
        self.layer.cornerRadius = 8
        
        self.addSubview(remunerationContainerStackView)
        
        NSLayoutConstraint.activate([
            remunerationContainerStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2),
            remunerationContainerStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2),
            remunerationContainerStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 4),
            remunerationContainerStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -4)
        ])
    }
}
