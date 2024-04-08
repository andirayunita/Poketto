//
//  PokemonViewModel.swift
//  Poketto
//
//  Created by Andira Yunita on 07/04/24.
//

import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var catchedPokemon: [Pokemon] = []
    
    func fetchPokemons() async {
        do {
            let fetchedPokemons = try await APIService.shared.fetchAllPokemons()
            self.pokemons = fetchedPokemons
            
            for (index, pokemon) in pokemons.enumerated() {
                let details = try await APIService.shared.fetchPokemonDetails(urlString: pokemon.url)
                self.pokemons[index].pokemonDetails = details
            }
        } catch {
            print("Error: Couldn't get all pokemons and its details from URL: \(Constants.pokemonsUrl), \(error.localizedDescription)")
        }
    }
    
    func releasePokemon(pokemon: Pokemon) {
        if let index = catchedPokemon.firstIndex(where: { $0.id == pokemon.id }) {
            self.catchedPokemon.remove(at: index)
        }
    }
    
    func catchedPokemon(pokemon: Pokemon) {
        if let index = pokemons.firstIndex(where: { $0.id == pokemon.id }) {
            pokemons[index].pokemonDetails?.isPokemonCatched.toggle()
            if pokemons[index].pokemonDetails?.isPokemonCatched == true {
                self.catchedPokemon.append(pokemons[index])
                print("Pokemon is catched!")
            } else {
                self.catchedPokemon.removeAll { $0.id == pokemon.id }
            }
        }
    }
}
