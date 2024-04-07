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
}
