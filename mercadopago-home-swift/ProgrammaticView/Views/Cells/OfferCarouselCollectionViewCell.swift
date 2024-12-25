//
//  OfferCarouselCollectionViewCell.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 25/12/2024.
//

import UIKit

class OfferCarouselCollectionViewCell: UICollectionViewCell {
    
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
        // Asegurarnos que el corner radius se aplique después del layout
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
        contentView.backgroundColor = .red
        
        // Configurar contentView
        contentView.layer.cornerRadius = 4
        contentView.clipsToBounds = true
        
        contentView.addSubview(offerImageView)
        
        NSLayoutConstraint.activate([
            offerImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            offerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            offerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            offerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        offerImageView.image = nil
    }
}
