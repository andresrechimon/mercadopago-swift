//
//  LastActivityCellUiView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 24/06/2025.
//

import SwiftUI

struct LastActivityCellUiView: View {
    var body: some View {
        HStack(spacing: 8) {
            ZStack {
                Circle()
                    .fill(.grayBackground)
                    .frame(width: 55, height: 55)
                Image(systemName: "shield")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .light))
            }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Roberto Malis")
                        .foregroundColor(.black)
                        .font(.customMedium(size: 16))
                    
                    Spacer()
                    
                    Text("- $ 6.300,50")
                        .foregroundColor(.black)
                        .font(.customRegular(size: 14))
                }
                
                HStack {
                    Text("Transferencia enviada")
                        .foregroundColor(.grayInfo)
                        .font(.customRegular(size: 12))
                    
                    Spacer()
                    
                    Text("24/jun")
                        .foregroundColor(.grayInfo)
                        .font(.customRegular(size: 12))
                }
                
                HStack(spacing: 4) {
                    ZStack {
                        Circle()
                            .fill(.grayBackground)
                            .frame(width: 15, height: 15)
                        Image(systemName: "shield")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(.black)
                            .font(.system(size: 12, weight: .light))
                    }
                    
                    Text("Dinero disponible")
                        .foregroundColor(.grayInfo)
                        .font(.customRegular(size: 12))
                }
            }
        }
        .padding(.top, 8)
        .padding(.bottom, 16)
    }
}

#Preview {
    LastActivityCellUiView()
}
