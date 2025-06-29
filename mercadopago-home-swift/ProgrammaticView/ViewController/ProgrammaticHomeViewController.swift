//
//  ProgrammaticHomeViewController.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/12/2024.
//

import UIKit
import SwiftUI

struct ProgrammaticHomeViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ProgrammaticHomeViewController {
        return ProgrammaticHomeViewController()
    }
    
    func updateUIViewController(_ uiViewController: ProgrammaticHomeViewController, context: Context) {}
}

class ProgrammaticHomeViewController: UIViewController {
    private let viewModel: ProgrammaticHomeViewModel = ProgrammaticHomeViewModel()
    
    private lazy var layout: UICollectionViewLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        
        return layout
    }()
    
    private lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.lightBlue.cgColor,
            UIColor.lightBlue.cgColor,
            UIColor.grayBackground.cgColor
        ]
        
        gradient.locations = [0.0, 0.15, 0.40]
        
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        return gradient
    }()
    
    private lazy var headerView: HeaderPrView = {
        let view = HeaderPrView(username: "Andrés Rechimon")
        view.delegate = self
        
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.showsVerticalScrollIndicator = false
        
        return scroll
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var transferBlockView: TransferBlockPrView = {
        let view = TransferBlockPrView()
        
        return view
    }()
    
    private lazy var servicesBlockView: ServicesBlockPrView = {
        let view = ServicesBlockPrView()
        
        return view
    }()
    
    //OFFERS CAROUSEL
    private lazy var offersCarouselCollectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.backgroundColor = .clear
        collection.dataSource = self
        collection.delegate = self
        collection.showsHorizontalScrollIndicator = false
        collection.register(OfferCarouselCollectionPrViewCell.self, forCellWithReuseIdentifier: "OfferCarouselCollectionViewCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collection.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        return collection
    }()
    //OFFERS CAROUSEL
    
    //HIGHLIGHTED FEATURES
    private lazy var highlightedFeaturesStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 24
        
        return stack
    }()
    
    private func setupHighlightedFeaturesView() {
        let highlightedFeatures: [HighlightFeature] = [
            HighlightFeature(
                icon: "hands.sparkles",
                title: NSLocalizedString("credits_title"),
                subInfo: NSLocalizedString("credits_info", parameters: "$ \(978982.toCurrency())")
            ),
            
            HighlightFeature(
                icon: "dollarsign.ring.dashed",
                title: NSLocalizedString("dollars_title"),
                mainInfo: "US$ \(569.69.toCurrency())",
                subInfo: NSLocalizedString("dollars_info", parameters: "$ \(1173.58.toCurrency())", "$ \(1172.36.toCurrency())")
            ),
            
            HighlightFeature(
                icon: "dollarsign.bank.building",
                title: NSLocalizedString("reserves_title"),
                percentage: 30.9,
                subInfo: NSLocalizedString("reserves_info")
            ),
            
            HighlightFeature(
                icon: "shield",
                title: NSLocalizedString("insurance_title"),
                subInfo: NSLocalizedString("insurance_info_old")
            )
        ]
        
        highlightedFeatures.forEach { feature in
            let view = HighlightFeaturePrView(icon: feature.icon, title: feature.title, percentage: feature.percentage, mainInfo: feature.mainInfo, subInfo: feature.subInfo)
            highlightedFeaturesStackView.addArrangedSubview(view)
        }
    }
    //HIGHLIGHTED FEATURES
    
    private lazy var recommendationsView: RecomendationsPrView = {
        let view = RecomendationsPrView()
        
        return view
    }()
    
    private lazy var lastActivityView: LastActivityPrView = {
        let view = LastActivityPrView()
        
        return view
    }()
    
    private lazy var repentanceButton: PrButton = {
        let button = PrButton(icon: "receipt", title: NSLocalizedString("repentance_title"))
        
        return button
    }()
    
    private lazy var cancelAccountButton: PrButton = {
        let button = PrButton(icon: "person", title: NSLocalizedString("cancel_account_title"))
        
        return button
    }()
    
    private lazy var separatorView: PrSeparatorView = {
        let view = PrSeparatorView()
        
        return view
    }()
    
    private lazy var separatorContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.topAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            separatorView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        return view
    }()
    
    private lazy var footerTextsView: FooterPrView = {
        let view = FooterPrView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackground
        
        self.setupGradient()
        self.setupView()
        self.setupScrollContent()
        self.setupHighlightedFeaturesView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupView() {
        view.addSubview(headerView)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupScrollContent() {
        stackView.addArrangedSubview(transferBlockView)
        stackView.addArrangedSubview(servicesBlockView)
        stackView.addArrangedSubview(offersCarouselCollectionView)
        stackView.addArrangedSubview(highlightedFeaturesStackView)
        stackView.addArrangedSubview(recommendationsView)
        stackView.addArrangedSubview(lastActivityView)
        stackView.addArrangedSubview(repentanceButton)
        stackView.addArrangedSubview(cancelAccountButton)
        stackView.addArrangedSubview(separatorContainerView)
        stackView.addArrangedSubview(footerTextsView)
    }
    
    private func setupGradient() {
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension ProgrammaticHomeViewController: HeaderPrViewDelegate {
    func popToMenu() {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true)
        }
    }
}

extension ProgrammaticHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: OfferCarouselCollectionPrViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCarouselCollectionViewCell", for: indexPath) as? OfferCarouselCollectionPrViewCell else { fatalError() }
        
        cell.setup(item: viewModel.offers[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: offersCarouselCollectionView.frame.width - 32, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets (top: 0, left: 16, bottom: 0, right: 16)
    }
}
