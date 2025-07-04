//
//  ContentView.swift
//  mercadopago-home-swift
//
//  Created by Andres Rechimon on 23/12/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var navProgrammaticHome = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("mp-main-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 150)
                
                Button(action: {
                    navProgrammaticHome = true
                }) {
                    Text("UIKit")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: SUIHomeViewController()
                    .navigationBarHidden(true)
                    .statusBarHidden(true)
                ) {
                    Text("SwiftUI")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationDestination(isPresented: $navProgrammaticHome) {
                ProgrammaticHomeViewControllerWrapper()
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                    .statusBarHidden(true)
            }
        }
    }
}

#Preview {
    ContentView()
}
