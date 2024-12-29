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
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    print("SwiftUI")
                }) {
                    Text("SwiftUI")
                        .padding()
                        .background(Color.blue)
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
