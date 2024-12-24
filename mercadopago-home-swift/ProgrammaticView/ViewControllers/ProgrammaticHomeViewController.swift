//
//  ProgrammaticHomeViewController.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/12/2024.
//

import UIKit
import SwiftUI

//
//  ProgrammaticHomeViewController.swift
//  mercadopago-swift
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
    
    private lazy var transferBlockView: TransferBlockPrView = {
        let view = TransferBlockPrView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .grayBackground
        
        setupGradient()
        setupView()
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
        view.addSubview(transferBlockView)
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            transferBlockView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
            transferBlockView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            transferBlockView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
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
