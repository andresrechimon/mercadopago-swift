//
//  LastActivityCellPrView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 02/01/2025.
//

import UIKit

struct LastActivity {
    let icon: String
    let title: String
    var disclaimer: String? = nil
    let paymentMethod: String
    let paymentMethodIcon: UIImage
    var paymentMethodIconBg: UIColor? = .white
    let amount: Double
    let date: Date
    let type: TypeBalance
    
    init(icon: String, title: String, disclaimer: String? = nil, paymentMethod: String, paymentMethodIcon: UIImage, paymentMethodIconBg: UIColor? = .white ,amount: Double, date: Date, type: TypeBalance) {
        self.icon = icon
        self.title = title
        self.disclaimer = disclaimer
        self.paymentMethod = paymentMethod
        self.paymentMethodIcon = paymentMethodIcon
        self.paymentMethodIconBg = paymentMethodIconBg
        self.amount = amount
        self.date = date
        self.type = type
    }
}

enum TypeBalance {
    case income
    case expense
}

class LastActivityCellPrView: UIView {
    private var lastActivity: LastActivity
    
    private lazy var circleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayBackground
        
        let circleUnits: CGFloat = 55
        
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
        image.tintColor = .black
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        image.image = UIImage(systemName: self.lastActivity.icon)?.withConfiguration(configuration)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        return image
    }()
    
    //INFO LABELS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .noyhBold(size: 20)
        label.numberOfLines = .zero
        label.text = self.lastActivity.title
        
        return label
    }()
    
    private lazy var disclaimerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .grayInfo
        label.font = .noyhRegular(size: 16)
        label.numberOfLines = .zero
        label.isHidden = self.lastActivity.disclaimer == nil
        label.text = self.lastActivity.disclaimer
        
        return label
    }()
    
    //PAYMENT METHOD
    private lazy var paymentMethodCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = self.lastActivity.paymentMethodIconBg
        view.layer.borderWidth = self.lastActivity.paymentMethodIconBg != .white ? 0 : 1.5
        view.layer.borderColor = UIColor.grayBackground.cgColor
        
        let circleUnits: CGFloat = 15
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: circleUnits),
            view.widthAnchor.constraint(equalToConstant: circleUnits),
        ])
        
        view.layer.cornerRadius = circleUnits / 2
        
        view.addSubview(paymentMethodIconView)
        
        NSLayoutConstraint.activate([
            paymentMethodIconView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            paymentMethodIconView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        return view
    }()
    
    private lazy var paymentMethodIconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        image.image = self.lastActivity.paymentMethodIcon.withConfiguration(configuration)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 12),
            image.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        return image
    }()
    
    private lazy var paymentMethodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .grayInfo
        label.font = .noyhRegular(size: 16)
        label.numberOfLines = .zero
        label.text = self.lastActivity.paymentMethod
        
        return label
    }()
    
    private lazy var paymentMethodStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [paymentMethodCircleView, paymentMethodLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 4
        
        return stackView
    }()
    //PAYMENT METHOD
    
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, disclaimerLabel, paymentMethodStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    //INFO LABELS
    
    //AMOUNT AND DATE
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = self.lastActivity.type == .expense ? .black : .numberPlus
        label.font = self.lastActivity.type == .expense ? .noyhRegular(size: 18) : .noyhMedium(size: 18)
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.text = "\(self.lastActivity.type == .expense ? "-" : "+") $ \(self.lastActivity.amount.toCurrency())"
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .grayInfo
        label.font = .noyhRegular(size: 16)
        label.numberOfLines = .zero
        label.textAlignment = .right
        label.text = self.lastActivity.date.toDateAbbrev()
        
        return label
    }()
    
    private lazy var amountDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [amountLabel, dateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        return stackView
    }()
    //AMOUNT AND DATE
    
    required init(lastActivity: LastActivity){
        self.lastActivity = lastActivity
        super.init(frame: CGRect.zero)
        self.applyStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func applyStyle() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 4
        self.backgroundColor = .white
        
        self.addSubview(circleContainerView)
        circleContainerView.addSubview(circleIconView)
        self.addSubview(infoStackView)
        self.addSubview(amountDateStackView)
        
        NSLayoutConstraint.activate([
            circleContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            circleContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            circleContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            circleIconView.centerYAnchor.constraint(equalTo: circleContainerView.centerYAnchor),
            circleIconView.centerXAnchor.constraint(equalTo: circleContainerView.centerXAnchor),
            
            infoStackView.centerYAnchor.constraint(equalTo: circleContainerView.centerYAnchor),
            infoStackView.leadingAnchor.constraint(equalTo: circleContainerView.trailingAnchor, constant: 8),
            
            amountDateStackView.topAnchor.constraint(equalTo: infoStackView.topAnchor),
            amountDateStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}
