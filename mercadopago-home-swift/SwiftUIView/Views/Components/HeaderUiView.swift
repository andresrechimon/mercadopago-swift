//
//  HeaderUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 27/05/2025.
//

import SwiftUI

struct HeaderUiView: View {
    var username: String
    var onTapCircle: () -> Void
    
    private var initials: String {
        let components = username.split(separator: " ")
        
        return components.map { String($0.prefix(1)) }.joined()
    }

    private var shortName: String {
        username.split(separator: " ").first.map(String.init) ?? ""
    }
    
    var body: some View {
            HStack {
                Button(action: onTapCircle) {
                    Text(initials)
                        .font(.customRegular(size: 16))
                        .foregroundColor(.black)
                        .frame(width: 35, height: 35)
                        .background(Color.circleContainerBackground)
                        .clipShape(Circle())
                }

                HStack(spacing: 4) {
                    Text(String(format: NSLocalizedString("hello_home", comment: ""), shortName))
                        .font(.customMedium(size: 16))
                        .foregroundColor(.white)

                    Image(systemName: "chevron.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                }

                Spacer()

                Image(systemName: "bell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.white)

                    HStack {
                        Image(systemName: "questionmark.circle")
                        Text(NSLocalizedString("help", comment: ""))
                    }
                    .font(.customMedium(size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.lightBlueButton)
                    .cornerRadius(6)
                }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.lightBlue)
        }
}

#Preview {
    HeaderUiView(username: "Andrés Rechimon", onTapCircle: {
        print("Circle tapped")
    })
}
