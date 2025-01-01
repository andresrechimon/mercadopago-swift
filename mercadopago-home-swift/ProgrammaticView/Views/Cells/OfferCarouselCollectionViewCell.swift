//
//  OfferCarouselCollectionViewCell.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import UIKit

class OfferCarouselCollectionViewCell: UICollectionViewCell {
    
    private lazy var closeCircleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayBackground
        
        let circleUnits: CGFloat = 15
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: circleUnits),
            view.widthAnchor.constraint(equalToConstant: circleUnits),
        ])
        
        view.layer.cornerRadius = circleUnits / 2
        
        return view
    }()
    
    private lazy var closeIconView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.tintColor = .black
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        image.image = UIImage(systemName: "xmark")?.withConfiguration(configuration)
        
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 12),
            image.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        return image
    }()
    
    private lazy var offerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        offerImageView.layer.cornerRadius = 8
    }
    
    func setup(item: Offer) {
        if let image = UIImage(named: item.banner) {
            offerImageView.image = image
        }
    }
    
    private func applyStyle() {
        contentView.layer.cornerRadius = 4
        contentView.clipsToBounds = true
        
        contentView.addSubview(offerImageView)
        offerImageView.addSubview(closeCircleView)
        closeCircleView.addSubview(closeIconView)
        
        NSLayoutConstraint.activate([
            offerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            offerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            offerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            offerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            closeCircleView.topAnchor.constraint(equalTo: offerImageView.topAnchor, constant: 8),
            closeCircleView.trailingAnchor.constraint(equalTo: offerImageView.trailingAnchor, constant: -8),
            
            closeIconView.centerYAnchor.constraint(equalTo: closeCircleView.centerYAnchor),
            closeIconView.centerXAnchor.constraint(equalTo: closeCircleView.centerXAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        offerImageView.image = nil
    }
}
