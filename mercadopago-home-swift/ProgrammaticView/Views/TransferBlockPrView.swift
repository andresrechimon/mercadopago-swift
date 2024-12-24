//
//  TransferBlockPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/12/2024.
//

import UIKit

struct TransferOption {
    let icon: String
    let title: String
}

class TransferBlockPrView: UIView {
    
    private lazy var availableLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .noyhMedium(size: 16)
        label.text = "Disponible"
        
        return label
    }()
    
    //REMUNERATION
    private lazy var remunerationContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundNumberPlus
        view.layer.cornerRadius = 8
        
        view.addSubview(remunerationContainerStackView)
        
        NSLayoutConstraint.activate([
            remunerationContainerStackView.topAnchor.constraint(equalTo: view.topAnchor),
            remunerationContainerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            remunerationContainerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
            remunerationContainerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4)
        ])
        
        return view
    }()
    
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
        label.textColor = .numberPlus
        label.font = .noyhBold(size: 8)
        label.text = "▴"
        
        return label
    }()
    
    private lazy var remunerationPerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .backgroundNumberPlus
        label.textColor = .numberPlus
        label.font = .noyhBold(size: 12)
        label.text = "32,4%"
        
        return label
    }()
    //REMUNERATION
    
    private lazy var movesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .noyhMedium(size: 16)
        button.setTitleColor(.lightBlueEmptyButton, for: .normal)
        button.setTitle(NSLocalizedString("Ir a movimientos", comment: ""), for: .normal)
        
        let symbolConfig = UIImage.SymbolConfiguration(
            pointSize: 12,
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
    
    private lazy var moneyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let amount = 78325.61
        let amountString = amount.toCurrencyString()
        
        let components = amountString.components(separatedBy: ",")
        guard components.count == 2 else { return label }
        
        let wholeNumber = components[0]
        let decimals = components[1]
        
        let attributedString = NSMutableAttributedString()
        
        let pesosSymbol = NSAttributedString(
            string: "$ ",
            attributes: [
                .font: UIFont.noyhBold(size: 32),
                .foregroundColor: UIColor.black
            ]
        )
        attributedString.append(pesosSymbol)
        
        let wholeNumberString = NSAttributedString(
            string: wholeNumber,
            attributes: [
                .font: UIFont.noyhBold(size: 32),
                .foregroundColor: UIColor.black
            ]
        )
        attributedString.append(wholeNumberString)
        
        attributedString.append(NSAttributedString(string: " "))
        
        let decimalsString = NSAttributedString(
            string: decimals,
            attributes: [
                .font: UIFont.noyhRegular(size: 16),
                .foregroundColor: UIColor.black,
                .baselineOffset: 10
            ]
        )
        attributedString.append(decimalsString)
        
        label.attributedText = attributedString
        
        return label
    }()
    
    //EYE
    private lazy var eyeContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayBackground
        
        let circleUnits: CGFloat = 30
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: circleUnits),
            view.widthAnchor.constraint(equalToConstant: circleUnits),
        ])
        
        view.layer.cornerRadius = circleUnits / 2
        
        return view
    }()
    
    private lazy var eyeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "eye")
        image.tintColor = .black
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 20),
            image.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        return image
    }()
    //EYE
    
    //OPTIONS
    private lazy var optionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        
        return stack
    }()
    
    private func setupOptionsView() {
        let transferOptions: [TransferOption] = [
            TransferOption(icon: "arrow.up.circle", title: "Ingresar"),
            TransferOption(icon: "arrow.right.circle", title: "Transferir"),
            TransferOption(icon: "arrow.down.circle", title: "Sacar"),
            TransferOption(icon: "person.text.rectangle", title: "Tu CVU")
        ]
        
        transferOptions.forEach { option in
            let view = TransferOptionView(icon: option.icon, title: option.title)
            
            optionsStackView.addArrangedSubview(view)
        }
    }
    //OPTIONS
    
    //CREDIT CARD
    private lazy var creditCardView: CreditCardView = {
        let view = CreditCardView()
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 85)
        ])
        
        return view
    }()
    //CREDIT CARD
    
    required init(){
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.applyContainerStyles()
        
        self.addSubview(availableLabel)
        self.addSubview(remunerationContainerView)
        self.addSubview(movesButton)
        self.addSubview(moneyLabel)
        self.addSubview(eyeContainerView)
        self.addSubview(eyeImageView)
        
        self.setupOptionsView()
        self.addSubview(optionsStackView)
        
        self.addSubview(creditCardView)

        NSLayoutConstraint.activate([
            availableLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            availableLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            remunerationContainerView.leadingAnchor.constraint(equalTo: availableLabel.trailingAnchor, constant: 8),
            remunerationContainerView.centerYAnchor.constraint(equalTo: availableLabel.centerYAnchor),
            
            movesButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            movesButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            moneyLabel.topAnchor.constraint(equalTo: availableLabel.bottomAnchor, constant: 4),
            moneyLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            eyeContainerView.leadingAnchor.constraint(equalTo: moneyLabel.trailingAnchor, constant: 8),
            eyeContainerView.centerYAnchor.constraint(equalTo: moneyLabel.centerYAnchor),
            eyeImageView.centerYAnchor.constraint(equalTo: eyeContainerView.centerYAnchor),
            eyeImageView.centerXAnchor.constraint(equalTo: eyeContainerView.centerXAnchor),
            
            optionsStackView.topAnchor.constraint(equalTo: moneyLabel.bottomAnchor, constant: 12),
            optionsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            optionsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            creditCardView.topAnchor.constraint(equalTo: optionsStackView.bottomAnchor, constant: 16),
            creditCardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            creditCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            creditCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
        ])
    }
    
    private func applyContainerStyles() {
        #warning("aplicar sombra")
        self.backgroundColor = .white
        self.layer.cornerRadius = 4
    }
}
