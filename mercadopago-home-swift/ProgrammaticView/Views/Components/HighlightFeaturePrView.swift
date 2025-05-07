//
//  HighlightFeaturePrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 01/01/2025.
//

import UIKit

struct HighlightFeature {
    let icon: String
    let title: String
    var percentage: Double? = nil
    var mainInfo: String? = nil
    let subInfo: String
    
    init(icon: String, title: String, percentage: Double? = nil, mainInfo: String? = nil, subInfo: String) {
        self.icon = icon
        self.title = title
        self.percentage = percentage
        self.mainInfo = mainInfo
        self.subInfo = subInfo
    }
}

class HighlightFeaturePrView: UIView {
    private var icon: String
    private var title: String
    private var percentage: Double?
    private var mainInfo: String?
    private var subInfo: String
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: self.icon)
        image.tintColor = .black
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .customMedium(size: 22)
        label.text = self.title
        
        return label
    }()
    
    private lazy var remunerationView: RemunerationPrView = {
        let view = RemunerationPrView(icon: "▴", percentage: self.percentage ?? 0, bgColor: .backgroundNumberPlus, textColor: .numberPlus)
        view.isHidden = self.percentage == nil
        
        return view
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .lightBlueEmptyButton
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 16),
            image.widthAnchor.constraint(equalToConstant: 16)
        ])
        
        return image
    }()
    
    private lazy var mainInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .customBold(size: 24)
        label.numberOfLines = .zero
        label.text = self.mainInfo
        label.isHidden = self.mainInfo == nil
        
        return label
    }()
    
    private lazy var subInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .customRegular(size: 16)
        label.numberOfLines = .zero
        label.text = self.subInfo
        
        return label
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 14
        stack.addArrangedSubview(mainInfoLabel)
        stack.addArrangedSubview(subInfoLabel)
        
        return stack
    }()

    required init(icon: String, title: String, percentage: Double? = nil, mainInfo: String? = nil, subInfo: String){
        self.icon = icon
        self.title = title
        self.percentage = percentage
        self.mainInfo = mainInfo
        self.subInfo = subInfo
        
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.applyContainerStyles()
        
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(remunerationView)
        containerView.addSubview(arrowImageView)
        containerView.addSubview(infoStackView)

        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            titleLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            
            remunerationView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            remunerationView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            
            arrowImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            arrowImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            infoStackView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16),
            infoStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            infoStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func applyContainerStyles(){
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
