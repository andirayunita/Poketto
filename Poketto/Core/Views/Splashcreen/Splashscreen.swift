//
//  Splashscreen.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct Splashscreen: View {
    @State private var scale = 0.5
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.yellow)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Image(.logo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                Text("Poketto")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            .scaleEffect(scale)
            .onAppear {
                withAnimation(.easeIn(duration: 0.8).repeatForever(autoreverses: true)) {
                    self.scale = 0.8
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    @State var isActive = true
    return Splashscreen(isActive: $isActive)
}
