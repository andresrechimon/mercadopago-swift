//
//  LastActivityUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct LastActivityUiView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text(NSLocalizedString("your_last_activity"))
                    .foregroundColor(.black)
                    .font(.customMedium(size: 18))
                Spacer()
                
                SeeAllButton()
            }
            
            VStack {
                LastActivityCellUiView()
                LastActivityCellUiView()
                LastActivityCellUiView()
            }
        }
        .padding(16)
        .containerStyle()
    }
}

struct SeeAllButton: View {
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 4) {
                Text(NSLocalizedString("see_all", comment: ""))
                    .font(.customMedium(size: 14))
                    .foregroundColor(.lightBlueEmptyButton)
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.lightBlueEmptyButton)
            }
        }
    }
}

#Preview {
    LastActivityUiView()
}
