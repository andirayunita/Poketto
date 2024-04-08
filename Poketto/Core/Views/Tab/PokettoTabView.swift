//
//  PokettoTabView.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct PokettoTabView: View {
    var body: some View {
        TabView {
            PokemonList()
                .tabItem {
                    Label("Pokemon", systemImage: "house.circle.fill")
                }
                .toolbarBackground(.white, for: .tabBar)
            
            MyPokemon()
                .tabItem {
                    Label("Collection", systemImage: "list.bullet.circle.fill")
                }
                .toolbarBackground(.white, for: .tabBar)
        }
        .tint(.yellow)
    }
}

#Preview {
    PokettoTabView()
}
