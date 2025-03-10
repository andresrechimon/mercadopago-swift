//
//  SUIHomeViewController.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 10/03/2025.
//

import SwiftUI

struct SUIHomeViewController: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color(uiColor: UIColor.lightBlue), location: 0.0),
                    .init(color: Color(uiColor: UIColor.lightBlue), location: 0.15),
                    .init(color: Color(uiColor: UIColor.grayBackground), location: 0.40)
                ]),
                startPoint: UnitPoint(x: 0.5, y: 0.0),
                endPoint: UnitPoint(x: 0.5, y: 1.0)
            )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SUIHomeViewController()
}
