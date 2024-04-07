//
//  PokemonList.swift
//  Poketto
//
//  Created by Andira Yunita on 05/04/24.
//

import SwiftUI

struct PokemonList: View {
    @StateObject private var pokemonVM = PokemonViewModel()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 150), spacing: 5)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(pokemonVM.pokemons, id: \.id) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonCell(pokemon: pokemon)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .navigationTitle(Constants.ViewTitles.pokemonTitle)
            .task {
                await pokemonVM.fetchPokemons()
            }
            .refreshable {
                await pokemonVM.fetchPokemons()
            }
        }
    }
}

#Preview {
    PokemonList()
}
