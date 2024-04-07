//
//  PokemonDetailView.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @State private var showAlert = false
    var pokemon: Pokemon
    
    var body: some View {
        ScrollView {
                ZStack {
                    RoundedRectangle(cornerRadius: 0.0)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 500, maxHeight: 650)
                        .foregroundStyle(ColorUtility.randomColor())
                    
                    AsyncImageView(pokemon: pokemon)
                        .frame(width: 200, height: 200)
                }
                .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(pokemon.name.capitalized)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                    
                    Text("Types: ") + Text(pokemon.pokemonDetails?.typesString ?? "")
                    Text("Moves: ") + Text(pokemon.pokemonDetails?.movesString ?? "")
                    Spacer()
                    Button {
                        print("Button tapped")
                    } label: {
                        Text("Catch Pokemon!")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 343, height: 56)
                            .background {
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(.yellow)
                            }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
        }
        .ignoresSafeArea(edges: .top)
        .scrollIndicators(.hidden)
    }
}

//#Preview {
//    PokemonDetailView()
//}
