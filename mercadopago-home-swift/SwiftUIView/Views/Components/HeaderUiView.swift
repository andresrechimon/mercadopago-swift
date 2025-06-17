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

    private var shortName: String {
        username.split(separator: " ").first.map(String.init) ?? ""
    }

    var body: some View {
        HStack(spacing: 0) {
            Button(action: onTapCircle) {
                Image("mp-no-bg")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
            }
            .padding(.leading, 16)

            HStack(spacing: 12) {
                Text(String(format: NSLocalizedString("hello_home"), shortName))
                    .font(.customMedium(size: 16))
                    .foregroundColor(.black)

                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 9, height: 9)
                    .foregroundColor(.black)
            }
            .padding(.leading, 8)

            Spacer()

            Image(systemName: "bell")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 22)
                .foregroundColor(.black)
                .padding(.trailing, 8)

            HStack(spacing: 0) {
                Image(systemName: "questionmark.circle")
                Text(NSLocalizedString("help"))
            }
            .font(.customMedium(size: 14))
            .foregroundColor(.black)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .frame(height: 32)
            .background(Color.lightYellowMp)
            .cornerRadius(6)
            .padding(.trailing, 16)
        }
        .frame(height: 59)
        .background(Color.yellowMp)
    }
}

#Preview {
    HeaderUiView(username: "Andrés Rechimon") {
        print("Circle tapped")
    }
}
