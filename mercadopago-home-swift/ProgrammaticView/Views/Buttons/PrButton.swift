//
//  PrButton.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/02/2025.
//

import UIKit

class PrButton: UIView {
    private var icon: String
    private var title: String
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var circleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.grayBackground.cgColor
        
        let circleUnits: CGFloat = 35
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: circleUnits),
            view.widthAnchor.constraint(equalToConstant: circleUnits),
        ])
        
        view.layer.cornerRadius = circleUnits / 2
        
        view.addSubview(circleIconView)
        
        NSLayoutConstraint.activate([
            circleIconView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circleIconView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    
    private lazy var circleIconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        image.image = UIImage(systemName: self.icon)?.withConfiguration(configuration)
        image.tintColor = .lightBlueButton
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 25),
            image.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .customRegular(size: 16)
        label.text = self.title
        
        return label
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
    
    required init(icon: String, title: String){
        self.icon = icon
        self.title = title
        
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.applyContainerStyles()
    }
    
    private func applyContainerStyles(){
        containerView.containerStyle()
        
        containerView.addSubview(circleContainerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(arrowImageView)
        self.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            circleContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            circleContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            circleContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            
            titleLabel.centerYAnchor.constraint(equalTo: circleContainerView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: circleContainerView.trailingAnchor, constant: 16),
            
            arrowImageView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16)
        ])
    }
}
