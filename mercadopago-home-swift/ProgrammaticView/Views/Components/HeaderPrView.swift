//
//  HeaderPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/12/2024.
//

import UIKit

protocol HeaderPrViewDelegate {
    func popToMenu()
}

class HeaderPrView: UIView {
    var delegate: HeaderPrViewDelegate?
    private var username: String
    
    private lazy var circleNameView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .circleContainerBackground
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 35),
            view.widthAnchor.constraint(equalToConstant: 35)
        ])
        
        view.layer.cornerRadius = 35 / 2
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(circleNameTapped))
        view.addGestureRecognizer(tapGesture)
        
        return view
    }()
    
    @objc private func circleNameTapped() {
        delegate?.popToMenu()
    }
    
    private lazy var initialsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = .zero
        label.font = .customRegular(size: 16)
        label.text = getInitials(for: self.username)
        
        return label
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = .zero
        label.font = .customMedium(size: 16)
        label.text = NSLocalizedString("hello_home", parameters: self.getName())
        
        return label
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "chevron.right")
        image.tintColor = .white
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 15),
            image.widthAnchor.constraint(equalToConstant: 15)
        ])
        
        return image
    }()
    
    private lazy var bellImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "bell")
        image.tintColor = .white
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 25),
            image.widthAnchor.constraint(equalToConstant: 25)
        ])
        
        return image
    }()
    
    private lazy var helpButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "questionmark.circle"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .customMedium(size: 16)
        button.backgroundColor = .lightBlueButton
        button.layer.cornerRadius = 6
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        button.setTitle(NSLocalizedString("help"), for: .normal)
        
        return button
    }()
    
    required init(username: String){
        self.username = username
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .lightBlue
        
        self.addSubview(circleNameView)
        self.addSubview(initialsLabel)
        self.addSubview(usernameLabel)
        self.addSubview(arrowImageView)
        self.addSubview(helpButton)
        self.addSubview(bellImageView)

        NSLayoutConstraint.activate([
            circleNameView.topAnchor.constraint(equalTo: self.topAnchor),
            circleNameView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            circleNameView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            initialsLabel.centerXAnchor.constraint(equalTo: circleNameView.centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: circleNameView.centerYAnchor),
            
            usernameLabel.leadingAnchor.constraint(equalTo: circleNameView.trailingAnchor, constant: 8),
            usernameLabel.centerYAnchor.constraint(equalTo: circleNameView.centerYAnchor),
            
            arrowImageView.leadingAnchor.constraint(equalTo: usernameLabel.trailingAnchor, constant: 12),
            arrowImageView.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            
            helpButton.topAnchor.constraint(equalTo: self.topAnchor),
            helpButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            helpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            helpButton.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor),
            
            bellImageView.trailingAnchor.constraint(equalTo: helpButton.leadingAnchor, constant: -8),
            bellImageView.centerYAnchor.constraint(equalTo: helpButton.centerYAnchor)
        ])
    }
    
    private func getName() -> String {
        let name = username.split(separator: " ").first
        return String(name ?? "")
    }
    
    private func getInitials(for name: String) -> String {
        return name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
    }
}


