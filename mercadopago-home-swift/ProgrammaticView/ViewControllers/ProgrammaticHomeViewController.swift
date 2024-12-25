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
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var transferBlockView: TransferBlockPrView = {
        let view = TransferBlockPrView()
        return view
    }()
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
    
    private lazy var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
    
    private lazy var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackground
        
        setupGradient()
        setupView()
        setupScrollContent()
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
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        stackView.addArrangedSubview(greenView)
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
